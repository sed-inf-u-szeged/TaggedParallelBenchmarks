/**
 * adi.c: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Will Killian <killian@udel.edu>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <math.h>
#include <platform_helper.h>
#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif

#define POLYBENCH_TIME 1

//select the OpenCL device to use (can be GPU, CPU, or Accelerator such as Intel Xeon Phi)
#define OPENCL_DEVICE_SELECTION CL_DEVICE_TYPE_ALL

#include "adi.h"
#include <polybench.h>
#include <polybenchUtilFuncts.h>

//define the error threshold for the results "not matching"
#define PERCENT_DIFF_ERROR_THRESHOLD 10.05

#define GPU_DEVICE 0

#define MAX_SOURCE_SIZE (0x10000000)

#if defined(cl_khr_fp64)  // Khronos extension available?
#pragma OPENCL EXTENSION cl_khr_fp64 : enable
#elif defined(cl_amd_fp64)  // AMD extension available?
#pragma OPENCL EXTENSION cl_amd_fp64 : enable
#endif

char str_temp[1024];

cl_platform_id platform_id;
cl_device_id device_id;   
cl_uint num_devices;
cl_uint num_platforms;
cl_int errcode;
cl_context clGPUContext;
cl_kernel clKernel1;
cl_kernel clKernel2;
cl_kernel clKernel3;
cl_kernel clKernel4;
cl_kernel clKernel5;
cl_kernel clKernel6;
cl_command_queue clCommandQue;
cl_program clProgram;
cl_mem a_mem_obj;
cl_mem b_mem_obj;
cl_mem x_mem_obj;
FILE *fp;
char *source_str;
size_t source_size;
unsigned int mem_size_A;
unsigned int mem_size_B;
unsigned int mem_size_X;

unsigned char *content;
const unsigned char *content_const;
size_t content_length;

#define RUN_ON_CPU


void init_array(int n, DATA_TYPE POLYBENCH_2D(A,N,N,n,n), DATA_TYPE POLYBENCH_2D(B,N,N,n,n), DATA_TYPE POLYBENCH_2D(X,N,N,n,n))
{
  	int i, j;

  	for (i = 0; i < n; i++)
	{
    		for (j = 0; j < n; j++)
      		{
			X[i][j] = ((DATA_TYPE) i*(j+1) + 1) / N;
			A[i][j] = ((DATA_TYPE) (i-1)*(j+4) + 2) / N;
			B[i][j] = ((DATA_TYPE) (i+3)*(j+7) + 3) / N;
      		}
	}
}


void compareResults(int n, DATA_TYPE POLYBENCH_2D(B_cpu,N,N,n,n), DATA_TYPE POLYBENCH_2D(B_fromGpu,N,N,n,n), DATA_TYPE POLYBENCH_2D(X_cpu,N,N,n,n), 
			DATA_TYPE POLYBENCH_2D(X_fromGpu,N,N,n,n))
{
	int i, j, fail;
	fail = 0;
	
	// Compare b and x output on cpu and gpu
	for (i=0; i < n; i++) 
	{
		for (j=0; j < n; j++) 
		{
			if (percentDiff(B_cpu[i][j], B_fromGpu[i][j]) > PERCENT_DIFF_ERROR_THRESHOLD) 
			{
				fail++;
			}
		}
	}
	
	for (i=0; i<n; i++) 
	{
		for (j=0; j<n; j++) 
		{
			if (percentDiff(X_cpu[i][j], X_fromGpu[i][j]) > PERCENT_DIFF_ERROR_THRESHOLD) 
			{
				fail++;
			}
		}
	}

	// Print results
	printf("Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\n", PERCENT_DIFF_ERROR_THRESHOLD, fail);
}


void read_cl_file(char* fileName)
{
	// Load the kernel source code into the array source_str
	/*fp = fopen("adi.cl", "r");
	if (!fp) {
		fprintf(stderr, "Failed to load kernel.\n");
		exit(1);
	}
	source_str = (char*)malloc(MAX_SOURCE_SIZE);
	source_size = fread( source_str, 1, MAX_SOURCE_SIZE, fp);
	fclose( fp );*/
	char * kernel = (char*)"kernel";
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

	errcode = clGetDeviceIDs( platform_id, OPENCL_DEVICE_SELECTION, 1, &device_id, &num_devices);
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

void cl_mem_init(DATA_TYPE POLYBENCH_2D(A,N,N,n,n), DATA_TYPE POLYBENCH_2D(B,N,N,n,n), DATA_TYPE POLYBENCH_2D(X,N,N,n,n))
{
	mem_size_A = N*N*sizeof(DATA_TYPE);
	mem_size_B = N*N*sizeof(DATA_TYPE);
	mem_size_X = N*N*sizeof(DATA_TYPE);

	a_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, mem_size_A, NULL, &errcode);
	b_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, mem_size_B, NULL, &errcode);
	x_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, mem_size_X, NULL, &errcode);
		
	if(errcode != CL_SUCCESS) printf("Error in creating buffers\n");

	errcode = clEnqueueWriteBuffer(clCommandQue, a_mem_obj, CL_TRUE, 0, mem_size_A, A, 0, NULL, NULL);
	errcode |= clEnqueueWriteBuffer(clCommandQue, b_mem_obj, CL_TRUE, 0, mem_size_B, B, 0, NULL, NULL);
	errcode |= clEnqueueWriteBuffer(clCommandQue, x_mem_obj, CL_TRUE, 0, mem_size_X, X, 0, NULL, NULL);
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
	clKernel1 = clCreateKernel(clProgram, "adi_kernel1", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel1\n");
	clKernel2 = clCreateKernel(clProgram, "adi_kernel2", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel2\n");
	clKernel3 = clCreateKernel(clProgram, "adi_kernel3", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel3\n");
	clKernel4 = clCreateKernel(clProgram, "adi_kernel4", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel4\n");
	clKernel5 = clCreateKernel(clProgram, "adi_kernel5", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel5\n");
	clKernel6 = clCreateKernel(clProgram, "adi_kernel6", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel6\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel1(int n)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = DIM_LOCAL_WORK_GROUP_Y;
	globalWorkSize[0] = (size_t)ceil(((float)N) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = 1;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel1, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel1, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel1, 2, sizeof(cl_mem), (void *)&x_mem_obj);
	errcode |= clSetKernelArg(clKernel1, 3, sizeof(int), (void *)&n);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel1, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel2(int n)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = 1;
	globalWorkSize[0] = (size_t)ceil(((float)N) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = 1;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel2, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel2, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel2, 2, sizeof(cl_mem), (void *)&x_mem_obj);
	errcode |= clSetKernelArg(clKernel2, 3, sizeof(int), (void *)&n);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel2, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel3(int n)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = 1;
	globalWorkSize[0] = (size_t)ceil(((float)N) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = 1;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel3, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel3, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel3, 2, sizeof(cl_mem), (void *)&x_mem_obj);
	errcode |= clSetKernelArg(clKernel3, 3, sizeof(int), (void *)&n);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel3, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel4(int i, int n)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = 1;
	globalWorkSize[0] = (size_t)ceil(((float)N) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = 1;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel4, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel4, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel4, 2, sizeof(cl_mem), (void *)&x_mem_obj);
	errcode |= clSetKernelArg(clKernel4, 3, sizeof(int), (void *)&i);
	errcode |= clSetKernelArg(clKernel4, 4, sizeof(int), (void *)&n);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel4, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel5(int n)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = 1;
	globalWorkSize[0] = (size_t)ceil(((float)N) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = 1;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel5, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel5, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel5, 2, sizeof(cl_mem), (void *)&x_mem_obj);
	errcode |= clSetKernelArg(clKernel5, 3, sizeof(int), (void *)&n);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel5, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);
}

void cl_launch_kernel6(int i, int n)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = 1;
	globalWorkSize[0] = (size_t)ceil(((float)N) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = 1;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel6, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel6, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel6, 2, sizeof(cl_mem), (void *)&x_mem_obj);
	errcode |= clSetKernelArg(clKernel6, 3, sizeof(int), (void *)&i);
	errcode |= clSetKernelArg(clKernel6, 4, sizeof(int), (void *)&n);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

	// Execute the OpenCL kernel
	errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel6, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
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
	errcode = clReleaseKernel(clKernel3);
	errcode = clReleaseKernel(clKernel4);
	errcode = clReleaseKernel(clKernel5);
	errcode = clReleaseKernel(clKernel6);
	errcode = clReleaseProgram(clProgram);
	errcode = clReleaseMemObject(a_mem_obj);
	errcode = clReleaseMemObject(b_mem_obj);
	errcode = clReleaseMemObject(x_mem_obj);
	errcode = clReleaseCommandQueue(clCommandQue);
	errcode = clReleaseContext(clGPUContext);
	if(errcode != CL_SUCCESS) printf("Error in cleanup\n");
}


void adi(int tsteps, int n, DATA_TYPE POLYBENCH_2D(A,N,N,n,n), DATA_TYPE POLYBENCH_2D(B,N,N,n,n), DATA_TYPE POLYBENCH_2D(X,N,N,n,n))
{
	int t, i1, i2;
	for (t = 0; t < _PB_TSTEPS; t++)
    	{
    		for (i1 = 0; i1 < _PB_N; i1++)
		{
			for (i2 = 1; i2 < _PB_N; i2++)
			{
				X[i1][i2] = X[i1][i2] - X[i1][(i2-1)] * A[i1][i2] / B[i1][(i2-1)];
				B[i1][i2] = B[i1][i2] - A[i1][i2] * A[i1][i2] / B[i1][(i2-1)];
			}
		}

	   	for (i1 = 0; i1 < _PB_N; i1++)
		{
			X[i1][(N-1)] = X[i1][(N-1)] / B[i1][(N-1)];
		}

	   	for (i1 = 0; i1 < _PB_N; i1++)
		{
			for (i2 = 0; i2 < _PB_N-2; i2++)
			{
				X[i1][(N-i2-2)] = (X[i1][(N-2-i2)] - X[i1][(N-2-i2-1)] * A[i1][(N-i2-3)]) / B[i1][(N-3-i2)];
			}
		}

	   	for (i1 = 1; i1 < _PB_N; i1++)
		{
			for (i2 = 0; i2 < _PB_N; i2++) 
			{
		  		X[i1][i2] = X[i1][i2] - X[(i1-1)][i2] * A[i1][i2] / B[(i1-1)][i2];
		  		B[i1][i2] = B[i1][i2] - A[i1][i2] * A[i1][i2] / B[(i1-1)][i2];
			}
		}

	   	for (i2 = 0; i2 < _PB_N; i2++)
		{
			X[(N-1)][i2] = X[(N-1)][i2] / B[(N-1)][i2];
		}

	   	for (i1 = 0; i1 < _PB_N-2; i1++)
		{
			for (i2 = 0; i2 < _PB_N; i2++)
			{
		 	 	X[(N-2-i1)][i2] = (X[(N-2-i1)][i2] - X[(N-i1-3)][i2] * A[(N-3-i1)][i2]) / B[(N-2-i1)][i2];
			}
		}
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int n,
		 DATA_TYPE POLYBENCH_2D(X,N,N,n,n))

{
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      fprintf(stderr, DATA_PRINTF_MODIFIER, X[i][j]);
      if ((i * N + j) % 20 == 0) fprintf(stderr, "\n");
    }
  fprintf(stderr, "\n");
}


int main(int argc, char *argv[])
{
	Components platDev = {-1,-1};
	platformAndDevice(argv[1],argv[2],&platDev);
        printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);

	int tsteps = TSTEPS;
	int n = N;

	POLYBENCH_2D_ARRAY_DECL(A,DATA_TYPE,N,N,n,n);
	POLYBENCH_2D_ARRAY_DECL(B,DATA_TYPE,N,N,n,n);
	POLYBENCH_2D_ARRAY_DECL(B_outputFromGpu,DATA_TYPE,N,N,n,n);
	POLYBENCH_2D_ARRAY_DECL(X,DATA_TYPE,N,N,n,n);
	POLYBENCH_2D_ARRAY_DECL(X_outputFromGpu,DATA_TYPE,N,N,n,n);

	init_array(n, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B), POLYBENCH_ARRAY(X));

	DYNAMIC_BEGIN("ADI_init")
	read_cl_file(argv[3]);
	cl_initialization(platDev.platformId, platDev.deviceId);
	DYNAMIC_END
	
	DYNAMIC_BEGIN("ADI_xfer_to")
	cl_mem_init(POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B), POLYBENCH_ARRAY(X));
	cl_load_prog();
	DYNAMIC_END
	
	/* Start timer. */
  	polybench_start_instruments;

	int t, i1;

	for (t = 0; t < _PB_TSTEPS; t++)
	{
		DYNAMIC_BEGIN("ADI_kernel_1")
		cl_launch_kernel1(n);
		DYNAMIC_END

		DYNAMIC_BEGIN("ADI_kernel_2")
		cl_launch_kernel2(n);
		DYNAMIC_END

		DYNAMIC_BEGIN("ADI_kernel_3")
		cl_launch_kernel3(n);
		DYNAMIC_END
	
		for (i1 = 1; i1 < _PB_N; i1++)
		{
			DYNAMIC_BEGIN("ADI_kernel_4")
			cl_launch_kernel4(i1, n);
			DYNAMIC_END
		}

		DYNAMIC_BEGIN("ADI_kernel_5")
		cl_launch_kernel5(n);
		DYNAMIC_END
		
		for (i1 = 0; i1 < _PB_N-2; i1++)
		{
			DYNAMIC_BEGIN("ADI_kernel_6")
			cl_launch_kernel6(i1, n);
			DYNAMIC_END
		}
	}	
	
	/* Stop and print timer. */
	printf("GPU Time in seconds:\n");
  	polybench_stop_instruments;
 	polybench_print_instruments;

	
	DYNAMIC_BEGIN("ADI_xfer_from")
	DYNAMIC_END
	errcode = clEnqueueReadBuffer(clCommandQue, b_mem_obj, CL_TRUE, 0, mem_size_B, POLYBENCH_ARRAY(B_outputFromGpu), 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in reading GPU mem\n");
	errcode = clEnqueueReadBuffer(clCommandQue, x_mem_obj, CL_TRUE, 0, mem_size_X, POLYBENCH_ARRAY(X_outputFromGpu), 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in reading GPU mem\n");

	
	#ifdef RUN_ON_CPU
	
		/* Start timer. */
	  	polybench_start_instruments;

		adi(tsteps, n, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B), POLYBENCH_ARRAY(X));
	
		/* Stop and print timer. */
		printf("CPU Time in seconds:\n");
	  	polybench_stop_instruments;
	 	polybench_print_instruments;

		compareResults(n, POLYBENCH_ARRAY(B), POLYBENCH_ARRAY(B_outputFromGpu), POLYBENCH_ARRAY(X), POLYBENCH_ARRAY(X_outputFromGpu));

	#else //prevent dead code elimination

		polybench_prevent_dce(print_array(n, POLYBENCH_ARRAY(X_outputFromGpu)));

	#endif //RUN_ON_CPU

	DYNAMIC_BEGIN("ADI_cleanup")
	cl_clean_up();
	DYNAMIC_END

	POLYBENCH_FREE_ARRAY(A);
	POLYBENCH_FREE_ARRAY(B);
	POLYBENCH_FREE_ARRAY(B_outputFromGpu);
	POLYBENCH_FREE_ARRAY(X);
	POLYBENCH_FREE_ARRAY(X_outputFromGpu);

    return 0;
}

// CL INCLUDE

/**
 * adi.cl: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Will Killian <killian@udel.edu>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */


int get_global_id(int){return 0;}
 
void adi_kernel1( DATA_TYPE* A,  DATA_TYPE* B,  DATA_TYPE* X, int n)
{
	STATIC_BEGIN("ADI_KERNEL_1", (), ())
	
	int i1 = get_global_id(0);
	int i2;	

	if ((i1 < n))
	{
		for (i2 = 1; i2 < n; i2++)
		{
			X[i1*n + i2] = X[i1*n + i2] - X[i1*n + (i2-1)] * A[i1*n + i2] / B[i1*n + (i2-1)];
			B[i1*n + i2] = B[i1*n + i2] - A[i1*n + i2] * A[i1*n + i2] / B[i1*n + (i2-1)];
		}
	}
	
	STATIC_END
}

void adi_kernel2( DATA_TYPE* A,  DATA_TYPE* B,  DATA_TYPE* X, int n)
{
	STATIC_BEGIN("ADI_KERNEL_2", (), ())
	int i1 = get_global_id(0);
	
	if ((i1 < n))
	{
		X[i1*n + (n-1)] = X[i1*n + (n-1)] / B[i1*n + (n-1)];
	}
	STATIC_END
}
	
 void adi_kernel3( DATA_TYPE* A,  DATA_TYPE* B,  DATA_TYPE* X, int n)
{
	STATIC_BEGIN("ADI_KERNEL_3", (), ())
	int i1 = get_global_id(0);
	int i2;	

	if ((i1 < n))
	{
		for (i2 = 0; i2 < n-2; i2++)
		{
			X[i1*n + (n-i2-2)] = (X[i1*n + (n-2-i2)] - X[i1*n + (n-2-i2-1)] * A[i1*n + (n-i2-3)]) / B[i1*n + (n-3-i2)];
		}
	}
	STATIC_END
}



 void adi_kernel4( DATA_TYPE* A,  DATA_TYPE* B,  DATA_TYPE* X, int i1, int n)
{
	STATIC_BEGIN("ADI_KERNEL_4", (), ())
	int i2 = get_global_id(0);
	
	if ((i2 < n))
	{
		X[i1*n + i2] = X[i1*n + i2] - X[(i1-1)*n + i2] * A[i1*n + i2] / B[(i1-1)*n + i2];
		B[i1*n + i2] = B[i1*n + i2] - A[i1*n + i2] * A[i1*n + i2] / B[(i1-1)*n + i2];
	}
	STATIC_END
}

 void adi_kernel5( DATA_TYPE* A,  DATA_TYPE* B,  DATA_TYPE* X, int n)
{
	STATIC_BEGIN("ADI_KERNEL_5", (), ())
	int i2 = get_global_id(0);
	
	if ((i2 < n))
	{
		X[(n-1)*n + i2] = X[(n-1)*n + i2] / B[(n-1)*n + i2];
	}
	STATIC_END
}

 void adi_kernel6( DATA_TYPE* A,  DATA_TYPE* B,  DATA_TYPE* X, int i1, int n)
{
	STATIC_BEGIN("ADI_KERNEL_6", (), ())
	int i2 = get_global_id(0);
	
	if ((i2 < n))
	{
	     X[(n-2-i1)*n + i2] = (X[(n-2-i1)*n + i2] - X[(n-i1-3)*n + i2] * A[(n-3-i1)*n + i2]) / B[(n-2-i1)*n + i2];
	}
	STATIC_END
}
 
