/**
 * doitgen.c: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Will Killian <killian@udel.edu>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */

#include <unistd.h>
#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include <platform_helper.h>

#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif

#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#endif

#define POLYBENCH_TIME 1

#include "doitgen.h"
#include <polybench.h>
#include <polybenchUtilFuncts.h>

//define the error threshold for the results "not matching"
#define PERCENT_DIFF_ERROR_THRESHOLD 0.05

#define GPU_DEVICE 0

#define MAX_SOURCE_SIZE (0x100000)


char str_temp[1024];


cl_platform_id platform_id;
cl_device_id device_id;   
cl_uint num_devices;
cl_uint num_platforms;
cl_int errcode;
cl_context clGPUContext;
cl_kernel clKernel1;
cl_kernel clKernel2;
cl_command_queue clCommandQue;
cl_program clProgram;
cl_mem a_mem_obj;
cl_mem b_mem_obj;
cl_mem c_mem_obj;
FILE *fp;
char *source_str;
size_t source_size;

unsigned char *content;
const unsigned char *content_const;
size_t content_length;

#define RUN_ON_CPU

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_doitgenCpu(int nr, int nq, int np,
		    DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np),
		    DATA_TYPE POLYBENCH_2D(C4,NP,NP,np,np),
		    DATA_TYPE POLYBENCH_3D(sum,NR,NQ,NP,nr,nq,np))
{
	int r, q, p, s;

	for (r = 0; r < _PB_NR; r++)
	{
		for (q = 0; q < _PB_NQ; q++)  
		{
			for (p = 0; p < _PB_NP; p++)  
			{
				sum[r][q][p] = 0;
				for (s = 0; s < _PB_NP; s++)
					sum[r][q][p] = sum[r][q][p] + A[r][q][s] * C4[s][p];
			}
			for (p = 0; p < _PB_NR; p++)
				A[r][q][p] = sum[r][q][p];
		}
	}

}



/* Array initialization. */
void init_array(int nr, int nq, int np,
		DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np),
		DATA_TYPE POLYBENCH_2D(C4,NP,NP,np,np))
{
	int i, j, k;

	for (i = 0; i < nr; i++)
		for (j = 0; j < nq; j++)
			for (k = 0; k < np; k++)
				A[i][j][k] = ((DATA_TYPE) i*j + k) / np;

	for (i = 0; i < np; i++)
		for (j = 0; j < np; j++)
			C4[i][j] = ((DATA_TYPE) i*j) / np;
}


void compareResults(int nr, int nq, int np, DATA_TYPE POLYBENCH_3D(sum,NR,NQ,NP,nr,nq,np), 
			DATA_TYPE POLYBENCH_3D(sum_outputFromGpu,NR,NQ,NP,nr,nq,np))
{
	int fail = 0;
	
	int r, q, p;
	for (r = 0; r < nr; r++)
	{
    		for (q = 0; q < nq; q++)  
		{
      			for (p = 0; p < np; p++)  
			{
				if (percentDiff(sum[r][q][p], sum_outputFromGpu[r][q][p]) > PERCENT_DIFF_ERROR_THRESHOLD)
				{
					fail++;
				}
			}
		}
	}
	
	// Print results
	printf("Number of misses: %d\n", fail);
}





void read_cl_file(char* fileName)
{
	// Load the kernel source code into the array source_str
	/*fp = fopen("doitgen.cl", "r");
	if (!fp) {
		fprintf(stderr, "Failed to load kernel.\n");
		exit(1);
	}
	source_str = (char*)malloc(MAX_SOURCE_SIZE);
	source_size = fread( source_str, 1, MAX_SOURCE_SIZE, fp);
	fclose( fp );*/
        fp = fopen(fileName, "rb");
        if(!fp) {printf("Error: unable to open '%s'\n", fileName);}
        content = (unsigned char*) read_file(fp, &content_length);
        content_const = content;
        fclose (fp);
}




void cl_initialization(int plat, int dev)
{
	// Get platform and device information
	/*errcode = clGetPlatformIDs(1, &platform_id, &num_platforms);
	if(errcode == CL_SUCCESS) printf("number of platforms is %d\n",num_platforms);

	errcode = clGetPlatformInfo(platform_id,CL_PLATFORM_NAME, sizeof(str_temp), str_temp,NULL);
	if(errcode == CL_SUCCESS) printf("platform name is %s\n",str_temp);

	errcode = clGetPlatformInfo(platform_id, CL_PLATFORM_VERSION, sizeof(str_temp), str_temp,NULL);
	if(errcode == CL_SUCCESS) printf("platform version is %s\n",str_temp);

	errcode = clGetDeviceIDs( platform_id, CL_DEVICE_TYPE_GPU, 1, &device_id, &num_devices);
	if(errcode == CL_SUCCESS) printf("device id is %d\n",device_id);

	errcode = clGetDeviceInfo(device_id,CL_DEVICE_NAME, sizeof(str_temp), str_temp,NULL);
	if(errcode == CL_SUCCESS) printf("device name is %s\n",str_temp);
	
	// Create an OpenCL context
	clGPUContext = clCreateContext( NULL, 1, &device_id, NULL, NULL, &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating context\n");
 
	//Create a command-queue
	clCommandQue = clCreateCommandQueue(clGPUContext, device_id, 0, &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating command queue\n");*/
	cl_uint platform_index = plat;
        cl_uint device_index = dev;
        cl_int ret;
        cl_uint platform_count;
        cl_uint device_count;

        ret = clGetPlatformIDs(0,NULL, &platform_count);
        if (ret != CL_SUCCESS){
            printf("Error: Cannot get platform count (OpenCL error: %d)", ret);
        }
        cl_platform_id *platforms = (cl_platform_id*)malloc(platform_count * sizeof(cl_platform_id));
        if (platforms == NULL){
            printf("Error: Out of memory");
        }
        ret = clGetPlatformIDs(platform_count, platforms, NULL);
        if (ret != CL_SUCCESS){
            printf("Error: Cannot get platform IDs (OpenCL error: %d)", ret);
        }
        platform_id = platforms[platform_index];
        free(platforms);
        ret = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ALL, 0, NULL, &device_count);
        if(ret != CL_SUCCESS){
            printf("Error: Cannot get device count (OpenCL error: %d)", ret);
        }
        cl_device_id *devices = (cl_device_id*)malloc(device_count * sizeof(cl_device_id));
        if (devices == NULL){
            printf("Error: Out of memory");
        }
        ret = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ALL, device_count, devices, NULL);
        if(ret != CL_SUCCESS){
            printf("Error: Cannot get device IDs (OpenCL error: %d)", ret);
        }
        device_id = devices[device_index];
        free(devices);

        clGPUContext = clCreateContext(0, 1, &device_id, NULL, NULL, &ret);
        if(!clGPUContext){
            printf("Error: Failed to create a compute context!\n");
        }
        clCommandQue = clCreateCommandQueue(clGPUContext, device_id, 0, &ret);
        if (!clCommandQue){
            printf("Error: Failed to create a command commands!\n");
        }
}

void cl_mem_init(DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np),
		    DATA_TYPE POLYBENCH_2D(C4,NP,NP,np,np),
		    DATA_TYPE POLYBENCH_3D(sum,NR,NQ,NP,nr,nq,np))
{
	a_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, NR * NQ * NP * sizeof(DATA_TYPE), NULL, &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating buffers\n");

	b_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, NP * NP * sizeof(DATA_TYPE), NULL, &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating buffers\n");

	c_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, NR * NQ * NP * sizeof(DATA_TYPE), NULL, &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating buffers\n");

	errcode = clEnqueueWriteBuffer(clCommandQue, a_mem_obj, CL_TRUE, 0, NR * NQ * NP * sizeof(DATA_TYPE), A, 0, NULL, NULL);
	if(errcode != CL_SUCCESS)printf("Error in writing buffers\n");
	errcode = clEnqueueWriteBuffer(clCommandQue, b_mem_obj, CL_TRUE, 0, NP * NP * sizeof(DATA_TYPE), C4, 0, NULL, NULL);
	if(errcode != CL_SUCCESS)printf("Error in writing buffers\n");
	errcode = clEnqueueWriteBuffer(clCommandQue, c_mem_obj, CL_TRUE, 0, NR * NQ * NP * sizeof(DATA_TYPE), sum, 0, NULL, NULL);
	if(errcode != CL_SUCCESS)printf("Error in writing buffers\n");
}

void cl_load_prog()
{
	// Create a program from the kernel source
	//clProgram = clCreateProgramWithSource(clGPUContext, 1, (const char **)&source_str, (const size_t *)&source_size, &errcode);
	clProgram = clCreateProgramWithBinary(clGPUContext, 1, &device_id, &content_length, &content_const, 0, &errcode);

	if(errcode != CL_SUCCESS) printf("Error in creating program\n");

	// Build the program
	errcode = clBuildProgram(clProgram, 1, &device_id, NULL, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in building program\n");
		
	// Create the OpenCL kernel
	clKernel1 = clCreateKernel(clProgram, "doitgen_kernel1", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel1\n");
	clKernel2 = clCreateKernel(clProgram, "doitgen_kernel2", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel2\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel1(int nr, int nq, int np, int r)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = DIM_LOCAL_WORK_GROUP_Y;
	globalWorkSize[0] = (size_t)ceil(((float)NP) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = (size_t)ceil(((float)NQ) / ((float)DIM_LOCAL_WORK_GROUP_Y)) * DIM_LOCAL_WORK_GROUP_Y;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel1, 0, sizeof(int), (void *)&nr);
	errcode |= clSetKernelArg(clKernel1, 1, sizeof(int), (void *)&nq);
	errcode |= clSetKernelArg(clKernel1, 2, sizeof(int), (void *)&np);
	errcode |= clSetKernelArg(clKernel1, 3, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel1, 4, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel1, 5, sizeof(cl_mem), (void *)&c_mem_obj);
	errcode |= clSetKernelArg(clKernel1, 6, sizeof(int), (void *)&r);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel1, 2, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel2(int nr, int nq, int np, int r)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = DIM_LOCAL_WORK_GROUP_Y;
	globalWorkSize[0] = (size_t)ceil(((float)NP) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = (size_t)ceil(((float)NQ) / ((float)DIM_LOCAL_WORK_GROUP_Y)) * DIM_LOCAL_WORK_GROUP_Y;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel2, 0, sizeof(int), (void *)&nr);
	errcode |= clSetKernelArg(clKernel2, 1, sizeof(int), (void *)&nq);
	errcode |= clSetKernelArg(clKernel2, 2, sizeof(int), (void *)&np);
	errcode |= clSetKernelArg(clKernel2, 3, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel2, 4, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel2, 5, sizeof(cl_mem), (void *)&c_mem_obj);
	errcode |= clSetKernelArg(clKernel2, 6, sizeof(int), (void *)&r);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel2, 2, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_clean_up()
{
	// Clean up
	errcode = clFlush(clCommandQue);
	errcode = clFinish(clCommandQue);
	errcode = clReleaseKernel(clKernel1);
	errcode = clReleaseKernel(clKernel2);
	errcode = clReleaseProgram(clProgram);
	errcode = clReleaseMemObject(a_mem_obj);
	errcode = clReleaseMemObject(b_mem_obj);
	errcode = clReleaseMemObject(c_mem_obj);
	errcode = clReleaseCommandQueue(clCommandQue);
	errcode = clReleaseContext(clGPUContext);
	if(errcode != CL_SUCCESS) printf("Error in cleanup\n");
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nr, int nq, int np,
		 DATA_TYPE POLYBENCH_3D(A,NR,NQ,NP,nr,nq,np))
{
	int i, j, k;

	for (i = 0; i < nr; i++)
	{
		for (j = 0; j < nq; j++)
		{
			for (k = 0; k < np; k++) 
			{
				fprintf (stderr, DATA_PRINTF_MODIFIER, A[i][j][k]);
				if (i % 20 == 0) fprintf (stderr, "\n");
			}
		}
	}
	fprintf (stderr, "\n");
}


int main(int argc, char *argv[])
{
	Components platDev = {-1,-1};
        platformAndDevice(argv[1],argv[2],&platDev);
        printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);
	/* Retrieve problem size. */
	int nr = NR;
	int nq = NQ;
	int np = NP;

	/* Variable declaration/allocation. */
	POLYBENCH_3D_ARRAY_DECL(A,DATA_TYPE,NR,NQ,NP,nr,nq,np);
	POLYBENCH_3D_ARRAY_DECL(sum,DATA_TYPE,NR,NQ,NP,nr,nq,np);
	POLYBENCH_3D_ARRAY_DECL(sum_outputFromGpu,DATA_TYPE,NR,NQ,NP,nr,nq,np);
	POLYBENCH_2D_ARRAY_DECL(C4,DATA_TYPE,NP,NP,np,np);

	/* Initialize array(s). */
	init_array (nr, nq, np,
	      POLYBENCH_ARRAY(A),
	      POLYBENCH_ARRAY(C4));

	DYNAMIC_BEGIN("DOITGEN_init")
	read_cl_file(argv[3]);
	cl_initialization(platDev.platformId, platDev.deviceId);
	DYNAMIC_END

	DYNAMIC_BEGIN("DOITGEN_xfer_to")
	cl_mem_init(POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(C4), POLYBENCH_ARRAY(sum));
	cl_load_prog();
	DYNAMIC_END

	/* Start timer. */
	polybench_start_instruments;


	int r;
	for (r = 0; r < NR; r++)
	{
		DYNAMIC_BEGIN("DOITGEN_kernel")
		cl_launch_kernel1(nr, nq, np, r);
		cl_launch_kernel2(nr, nq, np, r);
		DYNAMIC_END
	}

	/* Stop and print timer. */
	printf("GPU Time in seconds:\n");
	polybench_stop_instruments;
	polybench_print_instruments;

	DYNAMIC_BEGIN("DOITGEN_xfer_from")
	errcode = clEnqueueReadBuffer(clCommandQue, c_mem_obj, CL_TRUE, 0, NR * NQ * NP * sizeof(DATA_TYPE), sum_outputFromGpu, 0, NULL, NULL);
	DYNAMIC_END

	if(errcode != CL_SUCCESS) printf("Error in reading GPU mem\n");

	#ifdef RUN_ON_CPU

		/* Start timer. */
	  	polybench_start_instruments;

		/* Run kernel on CPU */
		kernel_doitgenCpu(nr, nq, np,
		  POLYBENCH_ARRAY(A),
		  POLYBENCH_ARRAY(C4),
		  POLYBENCH_ARRAY(sum));	
		
		/* Stop and print timer. */
		printf("CPU Time in seconds:\n");
  		polybench_stop_instruments;
	 	polybench_print_instruments;
	
		compareResults(nr, nq, np, POLYBENCH_ARRAY(sum), POLYBENCH_ARRAY(sum_outputFromGpu));

	#else //prevent dead code elimination

		polybench_prevent_dce(print_array(nr, nq, np, POLYBENCH_ARRAY(sum_outputFromGpu)));

	#endif //RUN_ON_CPU

	DYNAMIC_BEGIN("DOITGEN_cleanup")
	cl_clean_up();
	DYNAMIC_END

	/* Garbage collection */
	POLYBENCH_FREE_ARRAY(A);
	POLYBENCH_FREE_ARRAY(sum);
	POLYBENCH_FREE_ARRAY(sum_outputFromGpu);
	POLYBENCH_FREE_ARRAY(C4);	

	return 0;
}


int get_global_id(int){return 0;}


 void doitgen_kernel1(int nr, int nq, int np,  DATA_TYPE *A,  DATA_TYPE *C4,  DATA_TYPE *sum, int r)
{
	STATIC_BEGIN("DOITGEN_kernel_1", (), ())
	
	int p = get_global_id(0);
	int q = get_global_id(1);

	if ((p < np) && (q < nq))
	{
		sum[r * (nq * np) + q * np + p] = (DATA_TYPE)0.0;
	
		for (int s = 0; s < np; s++)
		{
			sum[r * (nq * np) + q * np + p] = sum[r * (nq * np) + q * np + p] + A[r * (nq * np) + q * np + s] * C4[s * np + p];
		}
	}
	STATIC_END
}

 void doitgen_kernel2(int nr, int nq, int np,  DATA_TYPE *A,  DATA_TYPE *C4,  DATA_TYPE *sum, int r)
{
	STATIC_BEGIN("DOITGEN_kernel_2", (), ())
	
	int p = get_global_id(0);
	int q = get_global_id(1);

	if ((p < np) && (q < nq))
	{
		A[r * (nq * np) + q * np + p] = sum[r * (nq * np) + q * np + p];
	}
	STATIC_END
}
