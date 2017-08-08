#include "hotspot.h"


void writeoutput(float *vect, int grid_rows, int grid_cols, char *file) {

	int i,j, index=0;
	FILE *fp;
	char str[STR_SIZE];

	if( (fp = fopen(file, "w" )) == 0 )
		printf( "The file was not opened\n" );

	for (i=0; i < grid_rows; i++) {
		for (j=0; j < grid_cols; j++)
		{
			sprintf(str, "%d\t%g\n", index, vect[i*grid_cols+j]);
			fputs(str,fp);
			index++;
		}
		fclose(fp);
	}
}


void readinput(float *vect, int grid_rows, int grid_cols, char *file) {

	int i,j;
	FILE *fp;
	char str[STR_SIZE];
	float val;

	if( (fp  = fopen(file, "r" )) ==0 )
			fatal( "The file was not opened" );

	for (i=0; i <= grid_rows-1; i++)
	 for (j=0; j <= grid_cols-1; j++)
	 {
		if (fgets(str, STR_SIZE, fp) == NULL) fatal("Error reading file\n");
		if (feof(fp))
			fatal("not enough lines in file");
		//if ((sscanf(str, "%d%f", &index, &val) != 2) || (index != ((i-1)*(grid_cols-2)+j-1)))
		if ((sscanf(str, "%f", &val) != 1))
			fatal("invalid file format");
		vect[i*grid_cols+j] = val;
	}

	fclose(fp);

}

/*
   compute N time steps
*/

int compute_tran_temp(cl_mem MatrixPower, cl_mem MatrixTemp[2], int col, int row, \
		int total_iterations, int num_iterations, int blockCols, int blockRows, int borderCols, int borderRows,
		float *TempCPU, float *PowerCPU) 
{

	float grid_height = chip_height / row;
	float grid_width = chip_width / col;

	float Cap = FACTOR_CHIP * SPEC_HEAT_SI * t_chip * grid_width * grid_height;
	float Rx = grid_width / (2.0 * K_SI * t_chip * grid_height);
	float Ry = grid_height / (2.0 * K_SI * t_chip * grid_width);
	float Rz = t_chip / (K_SI * grid_height * grid_width);

	float max_slope = MAX_PD / (FACTOR_CHIP * t_chip * SPEC_HEAT_SI);
	float step = PRECISION / max_slope;
	int t;

	int src = 0, dst = 1;
	
	cl_int error;

	// Determine GPU work group grid
	size_t global_work_size[2];
	global_work_size[0] = BLOCK_SIZE * blockCols;
	global_work_size[1] = BLOCK_SIZE * blockRows;
	size_t local_work_size[2];
	local_work_size[0] = BLOCK_SIZE;
	local_work_size[1] = BLOCK_SIZE;

	long long start_time = get_time();

	for (t = 0; t < total_iterations; t += num_iterations) {

		// Specify kernel arguments
		int iter = MIN(num_iterations, total_iterations - t);
		DYNAMIC_BEGIN("hotspot_kernel")
		STATIC_BEGIN("hotspot_kernel", (result, temp, power, row, col, Cap, Rx, Ry, Rz, step), (result, temp))
		clSetKernelArg(kernel, 0, sizeof(int), (void *) &iter);
		clSetKernelArg(kernel, 1, sizeof(cl_mem), (void *) &MatrixPower);
		clSetKernelArg(kernel, 2, sizeof(cl_mem), (void *) &MatrixTemp[src]);
		clSetKernelArg(kernel, 3, sizeof(cl_mem), (void *) &MatrixTemp[dst]);
		clSetKernelArg(kernel, 4, sizeof(int), (void *) &col);
		clSetKernelArg(kernel, 5, sizeof(int), (void *) &row);
		clSetKernelArg(kernel, 6, sizeof(int), (void *) &borderCols);
		clSetKernelArg(kernel, 7, sizeof(int), (void *) &borderRows);
		clSetKernelArg(kernel, 8, sizeof(float), (void *) &Cap);
		clSetKernelArg(kernel, 9, sizeof(float), (void *) &Rx);
		clSetKernelArg(kernel, 10, sizeof(float), (void *) &Ry);
		clSetKernelArg(kernel, 11, sizeof(float), (void *) &Rz);
		clSetKernelArg(kernel, 12, sizeof(float), (void *) &step);

		// Launch kernel
		error = clEnqueueNDRangeKernel(command_queue, kernel, 2, NULL, global_work_size, local_work_size, 0, NULL, NULL);
		if (error != CL_SUCCESS) {
			DYNAMIC_END
			fatal_CL(error, __LINE__);
		}

		// Flush the queue
		error = clFlush(command_queue);
		STATIC_END
		DYNAMIC_END

		if (error != CL_SUCCESS) fatal_CL(error, __LINE__);

		// Swap input and output GPU matrices
		src = 1 - src;
		dst = 1 - dst;
	}

	// Wait for all operations to finish
	error = clFinish(command_queue);

	if (error != CL_SUCCESS) fatal_CL(error, __LINE__);
	
	long long end_time = get_time();
	long long total_time = (end_time - start_time); 
	printf("\nKernel time: %.3f seconds\n", ((float) total_time) / (1000*1000));

	return src;
}

void usage(int argc, char **argv) {
	fprintf(stderr, "Usage: %s <grid_rows/grid_cols> <pyramid_height> <sim_time> <temp_file> <power_file> <output_file>\n", argv[0]);
	fprintf(stderr, "\t<grid_rows/grid_cols>  - number of rows/cols in the grid (positive integer)\n");
	fprintf(stderr, "\t<pyramid_height> - pyramid heigh(positive integer)\n");
	fprintf(stderr, "\t<sim_time>   - number of iterations\n");
	fprintf(stderr, "\t<temp_file>  - name of the file containing the initial temperature values of each cell\n");
	fprintf(stderr, "\t<power_file> - name of the file containing the dissipated power values of each cell\n");
	fprintf(stderr, "\t<output_file> - name of the output file\n");
	fprintf(stderr, "\t<device Number> - GPU:0, CPU:1 \n");
	exit(1);
}

int main(int argc, char** argv) {
	DYNAMIC_BEGIN("hotspot_initialize_cl_objects")
	platformAndDevice(argv[1],argv[2],&platDev);
	printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);
	char* sourceFileName = argv[3];
	FILE * fp = fopen(sourceFileName, "rb"); 
	if(!fp) {
		printf("ERROR: unable to open '%s'\n", sourceFileName);
		DYNAMIC_END
		return -1;
	}

	size_t content_length;
	unsigned char *content = (unsigned char*)read_file(fp, &content_length);
	const unsigned char *content_const = content; // nasty; only to keep clCreateProgramWithBinary from complaining about incompatible pointer types
	fclose(fp);

	cl_int error;

	cl_uint platform_index = platDev.platformId;
	cl_uint device_index = platDev.deviceId;
	cl_uint platform_count; 
	error = clGetPlatformIDs(0, NULL, &platform_count); 
	if (error != CL_SUCCESS) 
	{
		printf("Error: Cannot get platform count (OpenCL error: %d)", error);
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	cl_platform_id *platforms = (cl_platform_id*)malloc(platform_count * sizeof(cl_platform_id));
	if (platforms == NULL)
	{
		printf("Error: Out of memory");
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	error = clGetPlatformIDs(platform_count, platforms, NULL);
	if (error != CL_SUCCESS)
	{
		printf("Error: Cannot get platform IDs (OpenCL error: %d)", error);
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	cl_platform_id platform_id = platforms[platform_index];
	free(platforms);

	cl_uint device_count;
	error = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ALL, 0, NULL, &device_count);
	if (error != CL_SUCCESS)
	{
		printf("Error: Cannot get device count (OpenCL error: %d)", error);
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	cl_device_id *devices = (cl_device_id*)malloc(device_count * sizeof(cl_device_id));
	if (devices == NULL)
	{
		printf("Error: Out of memory");
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	error = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ALL, device_count, devices, NULL);
	if (error != CL_SUCCESS)
	{
		printf("Error: Cannot get device IDs (OpenCL error: %d)", error);
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	device_id = devices[device_index];
	free(devices);

	// Create a compute context 
	//
	context = clCreateContext(0, 1, &device_id, NULL, NULL, &error);
	if (!context)
	{
		printf("Error: Failed to create a compute context!\n");
		DYNAMIC_END
		return EXIT_FAILURE;
	}

	// Create a command commands
	//
	command_queue = clCreateCommandQueue(context, device_id, 0, &error);
	if (!command_queue)
	{
		printf("Error: Failed to create a command commands!\n");
		DYNAMIC_END
		return EXIT_FAILURE;
	}
	DYNAMIC_END

	int size;
	int grid_rows,grid_cols = 0;
	float *FilesavingTemp,*FilesavingPower; //,*MatrixOut; 
	char *tfile, *pfile, *ofile;
	
	int total_iterations = 60;
	int pyramid_height = 1; // number of iterations
	
	if (argc < 8)
		usage(argc, argv);
	if((grid_rows = atoi(argv[4]))<=0||
	   (grid_cols = atoi(argv[4]))<=0||
	   (pyramid_height = atoi(argv[5]))<=0||
	   (total_iterations = atoi(argv[6]))<=0)
		usage(argc, argv);

	tfile=argv[7];
	pfile=argv[8];
	ofile=argv[9];

	size=grid_rows*grid_cols;

	// --------------- pyramid parameters --------------- 
	int borderCols = (pyramid_height)*EXPAND_RATE/2;
	int borderRows = (pyramid_height)*EXPAND_RATE/2;
	int smallBlockCol = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
	int smallBlockRow = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
	int blockCols = grid_cols/smallBlockCol+((grid_cols%smallBlockCol==0)?0:1);
	int blockRows = grid_rows/smallBlockRow+((grid_rows%smallBlockRow==0)?0:1);

	FilesavingTemp = (float *) malloc(size*sizeof(float));
	FilesavingPower = (float *) malloc(size*sizeof(float));
	// MatrixOut = (float *) calloc (size, sizeof(float));

	if( !FilesavingPower || !FilesavingTemp) // || !MatrixOut)
		fatal("unable to allocate memory");

	// Read input data from disk
	readinput(FilesavingTemp, grid_rows, grid_cols, tfile);
	readinput(FilesavingPower, grid_rows, grid_cols, pfile);

	DYNAMIC_BEGIN("hotspot_initialize_cl_objects")
	cl_program program = clCreateProgramWithBinary(context,1,&device_id, &content_length, &content_const,0,&error);
	if (error != CL_SUCCESS) {
		DYNAMIC_END
		fatal_CL(error, __LINE__);
	}

	// Create an executable from the kernel
	//error = clBuildProgram(program, 1, &device, NULL, NULL, NULL);
	error = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);
	DYNAMIC_END
	// Show compiler warnings/errors
	static char log[65536]; memset(log, 0, sizeof(log));
	//clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, sizeof(log)-1, log, NULL);
	if (strstr(log,"warning:") || strstr(log, "error:")) printf("<<<<\n%s\n>>>>\n", log);

	if (error != CL_SUCCESS) fatal_CL(error, __LINE__);

	DYNAMIC_BEGIN("hotspot_initialize_cl_objects")
	kernel = clCreateKernel(program, "hotspot", &error);
	DYNAMIC_END

	if (error != CL_SUCCESS) fatal_CL(error, __LINE__);

	long long start_time = get_time();

	// Create two temperature matrices and copy the temperature input data
	cl_mem MatrixTemp[2];
	// Create input memory buffers on device
	DYNAMIC_BEGIN("hotspot_initialize_cl_objects")
	MatrixTemp[0] = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_USE_HOST_PTR, sizeof(float) * size, FilesavingTemp, &error);
	if (error != CL_SUCCESS) {
		DYNAMIC_END
		fatal_CL(error, __LINE__);
	}
	MatrixTemp[1] = clCreateBuffer(context, CL_MEM_READ_WRITE | CL_MEM_ALLOC_HOST_PTR, sizeof(float) * size, NULL, &error);
	if (error != CL_SUCCESS) {
		DYNAMIC_END
		fatal_CL(error, __LINE__);
	}

	// Copy the power input data
	cl_mem MatrixPower = clCreateBuffer(context, CL_MEM_READ_ONLY | CL_MEM_USE_HOST_PTR, sizeof(float) * size, FilesavingPower, &error);
	DYNAMIC_END
	if (error != CL_SUCCESS)
		fatal_CL(error, __LINE__);

	// Perform the computation
	int ret = -1;

	ret = compute_tran_temp(MatrixPower, MatrixTemp, grid_cols, grid_rows, total_iterations, pyramid_height,
								blockCols, blockRows, borderCols, borderRows, FilesavingTemp, FilesavingPower);

	// Copy final temperature data back
	DYNAMIC_BEGIN("hotspot_transfer_data_from_device_to_host")
	cl_float *MatrixOut = (cl_float *) clEnqueueMapBuffer(command_queue, MatrixTemp[ret], CL_TRUE, CL_MAP_READ, 0, sizeof(float) * size, 0, NULL, NULL, &error);
	DYNAMIC_END
	if (error != CL_SUCCESS) fatal_CL(error, __LINE__);
	//DYNAMIC_END
	long long end_time = get_time();    
	printf("Total time: %.3f seconds\n", ((float) (end_time - start_time)) / (1000*1000));

	// Write final output to output file
	writeoutput(MatrixOut, grid_rows, grid_cols, ofile);
	DYNAMIC_BEGIN("hotspot_transfer_data_from_device_to_host")
	error = clEnqueueUnmapMemObject(command_queue, MatrixTemp[ret], (void *) MatrixOut, 0, NULL, NULL);
	DYNAMIC_END

	if (error != CL_SUCCESS)
		fatal_CL(error, __LINE__);

	DYNAMIC_BEGIN("hotspot_release_cl_resources")
	clReleaseMemObject(MatrixTemp[0]);
	clReleaseMemObject(MatrixTemp[1]);
	clReleaseMemObject(MatrixPower);
	clReleaseContext(context);
	DYNAMIC_END

	return 0;
}
