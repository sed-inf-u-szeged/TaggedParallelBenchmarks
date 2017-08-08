/**
 * 3DConvolution.c: This file is part of the PolyBench/GPU 1.0 test suite.
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
#define OPENCL_DEVICE_SELECTION CL_DEVICE_TYPE_GPU

#include "3DConvolution.h"
#include <polybench.h>
#include <polybenchUtilFuncts.h>

//define the error threshold for the results "not matching"
#define PERCENT_DIFF_ERROR_THRESHOLD 1.05

#define MAX_SOURCE_SIZE (0x100000)

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
cl_kernel clKernel;
cl_command_queue clCommandQue;
cl_program clProgram;
cl_mem a_mem_obj;
cl_mem b_mem_obj;
FILE *fp;
char *source_str;
size_t source_size;

unsigned char *content;
const unsigned char *content_const;
size_t content_length;

//#define RUN_ON_CPU


void read_cl_file(char* fileName)
{
	// Load the kernel source code into the array source_str
	/*fp = fopen("3DConvolution.cl", "r");
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


void init(int ni, int nj, int nk, DATA_TYPE POLYBENCH_3D(A, NI, NJ, NK, ni, nj, nk))
{
	int i, j, k;

	for (i = 0; i < ni; ++i)
    	{
		for (j = 0; j < nj; ++j)
		{
			for (k = 0; k < nk; ++k)
			{
				A[i][j][k] = i % 12 + 2 * (j % 7) + 3 * (k % 13);
			}
		}
	}
}


void cl_initialization(int plat, int dev)
{
	// Get platform and device information
	/*errcode = clGetPlatformIDs(1, &platform_id, &num_platforms);
	if(errcode == CL_SUCCESS) printf("number of platforms is %d\n",num_platforms);
	else printf("Error getting platform IDs\n");

	errcode = clGetPlatformInfo(platform_id,CL_PLATFORM_NAME, sizeof(str_temp), str_temp,NULL);
	if(errcode == CL_SUCCESS) printf("platform name is %s\n",str_temp);
	else printf("Error getting platform name\n");

	errcode = clGetPlatformInfo(platform_id, CL_PLATFORM_VERSION, sizeof(str_temp), str_temp,NULL);
	if(errcode == CL_SUCCESS) printf("platform version is %s\n",str_temp);
	else printf("Error getting platform version\n");

	errcode = clGetDeviceIDs( platform_id, OPENCL_DEVICE_SELECTION, 1, &device_id, &num_devices);
	if(errcode == CL_SUCCESS) printf("number of devices is %d\n", num_devices);
	else printf("Error getting device IDs\n");

	errcode = clGetDeviceInfo(device_id,CL_DEVICE_NAME, sizeof(str_temp), str_temp,NULL);
	if(errcode == CL_SUCCESS) printf("device name is %s\n",str_temp);
	else printf("Error getting device name\n");
	
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


void cl_mem_init(DATA_TYPE POLYBENCH_3D(A, NI, NJ, NK, ni, nj, nk), DATA_TYPE POLYBENCH_3D(B, NI, NJ, NK, ni, nj, nk))
{
	a_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_ONLY, sizeof(DATA_TYPE) * NI * NJ * NK, NULL, &errcode);
	b_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, sizeof(DATA_TYPE) * NI * NJ * NK, NULL, &errcode);
	
	if(errcode != CL_SUCCESS) printf("Error in creating buffers\n");

	errcode = clEnqueueWriteBuffer(clCommandQue, a_mem_obj, CL_TRUE, 0, sizeof(DATA_TYPE) * NI * NJ * NK, A, 0, NULL, NULL);
	errcode = clEnqueueWriteBuffer(clCommandQue, b_mem_obj, CL_TRUE, 0, sizeof(DATA_TYPE) * NI * NJ * NK, B, 0, NULL, NULL);
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
	clKernel = clCreateKernel(clProgram, "Convolution3D_kernel", &errcode);
	if(errcode != CL_SUCCESS) printf("Error in creating kernel\n");
	clFinish(clCommandQue);
}


void cl_launch_kernel(int ni, int nj, int nk)
{
	size_t localWorkSize[2], globalWorkSize[2];
	localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
	localWorkSize[1] = DIM_LOCAL_WORK_GROUP_Y;
	globalWorkSize[0] = (size_t)ceil(((float)NK) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
	globalWorkSize[1] = (size_t)ceil(((float)NJ) / ((float)DIM_LOCAL_WORK_GROUP_Y)) * DIM_LOCAL_WORK_GROUP_Y;

	/* Start timer. */
  	polybench_start_instruments;
	
	// Set the arguments of the kernel
	errcode =  clSetKernelArg(clKernel, 0, sizeof(cl_mem), (void *)&a_mem_obj);
	errcode |= clSetKernelArg(clKernel, 1, sizeof(cl_mem), (void *)&b_mem_obj);
	errcode |= clSetKernelArg(clKernel, 2, sizeof(int), &ni);
	errcode |= clSetKernelArg(clKernel, 3, sizeof(int), &nj);
	errcode |= clSetKernelArg(clKernel, 4, sizeof(int), &nk);
	if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");
	
	int i;
	for (i = 1; i < NI - 1; ++i) // 0
	{
		// set the current value of 'i' for the argument in the kernel
		errcode |= clSetKernelArg(clKernel, 5, sizeof(int), &i);

		// Execute the OpenCL kernel
		errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel, 2, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
	}

	if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
	clFinish(clCommandQue);

	/* Stop and print timer. */
	printf("GPU Time in seconds:\n");
  	polybench_stop_instruments;
 	polybench_print_instruments;
}


void cl_clean_up()
{
	// Clean up
	errcode = clFlush(clCommandQue);
	errcode = clFinish(clCommandQue);
	errcode = clReleaseKernel(clKernel);
	errcode = clReleaseProgram(clProgram);
	errcode = clReleaseMemObject(a_mem_obj);
	errcode = clReleaseMemObject(b_mem_obj);
	errcode = clReleaseCommandQueue(clCommandQue);
	errcode = clReleaseContext(clGPUContext);
	if(errcode != CL_SUCCESS) printf("Error in cleanup\n");
}


void compareResults(int ni, int nj, int nk, DATA_TYPE POLYBENCH_3D(B, NI, NJ, NK, ni, nj, nk), DATA_TYPE POLYBENCH_3D(B_outputFromGpu, NI, NJ, NK, ni, nj, nk))
{
	int i, j, k, fail;
	fail = 0;
	
	// Compare result from cpu and gpu
	for (i = 1; i < ni - 1; ++i) // 0
	{
		for (j = 1; j < nj - 1; ++j) // 1
		{
			for (k = 1; k < nk - 1; ++k) // 2
			{
				if (percentDiff(B[i][j][k], B_outputFromGpu[i][j][k]) > PERCENT_DIFF_ERROR_THRESHOLD)
				{
					fail++;
				}
			}	
		}
	}
	
	// Print results
	printf("Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\n", PERCENT_DIFF_ERROR_THRESHOLD, fail);
}


void conv3D(int ni, int nj, int nk, DATA_TYPE POLYBENCH_3D(A, NI, NJ, NK, ni, nj, nk), DATA_TYPE POLYBENCH_3D(B, NI, NJ, NK, ni, nj, nk))
{
	int i, j, k;
	DATA_TYPE c11, c12, c13, c21, c22, c23, c31, c32, c33;

	c11 = +2;  c21 = +5;  c31 = -8;
	c12 = -3;  c22 = +6;  c32 = -9;
	c13 = +4;  c23 = +7;  c33 = +10;

	for (i = 1; i < _PB_NI - 1; ++i) // 0
	{
		for (j = 1; j < _PB_NJ - 1; ++j) // 1
		{
			for (k = 1; k < _PB_NK -1; ++k) // 2
			{
				B[i][j][k] = c11 * A[(i - 1)][(j - 1)][(k - 1)]  +  c13 * A[(i + 1)][(j - 1)][(k - 1)]
					     +   c21 * A[(i - 1)][(j - 1)][(k - 1)]  +  c23 * A[(i + 1)][(j - 1)][(k - 1)]
					     +   c31 * A[(i - 1)][(j - 1)][(k - 1)]  +  c33 * A[(i + 1)][(j - 1)][(k - 1)]
					     +   c12 * A[(i + 0)][(j - 1)][(k + 0)]  +  c22 * A[(i + 0)][(j + 0)][(k + 0)]   
					     +   c32 * A[(i + 0)][(j + 1)][(k + 0)]  +  c11 * A[(i - 1)][(j - 1)][(k + 1)]  
					     +   c13 * A[(i + 1)][(j - 1)][(k + 1)]  +  c21 * A[(i - 1)][(j + 0)][(k + 1)]  
					     +   c23 * A[(i + 1)][(j + 0)][(k + 1)]  +  c31 * A[(i - 1)][(j + 1)][(k + 1)]  
					     +   c33 * A[(i + 1)][(j + 1)][(k + 1)];
			}
		}
	}
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int ni, int nj, int nk,
		 DATA_TYPE POLYBENCH_3D(B,NI,NJ,NK,ni,nj,nk))
{
  int i, j, k;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) 
	for (k = 0; k < nk; k++)
	{
	fprintf (stderr, DATA_PRINTF_MODIFIER, B[i][j][k]);
	if ((i * (nj*nk) + j*nk + k) % 20 == 0) fprintf (stderr, "\n");
    }
  fprintf (stderr, "\n");
}


int main(int argc, char *argv[])
{
	Components platDev = {-1,-1};
        platformAndDevice(argv[1],argv[2],&platDev);
        printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);

	int ni = NI;
	int nj = NJ;
	int nk = NK;

	POLYBENCH_3D_ARRAY_DECL(A,DATA_TYPE,NI,NJ,NK,ni,nj,nk);
	POLYBENCH_3D_ARRAY_DECL(B,DATA_TYPE,NI,NJ,NK,ni,nj,nk);
	POLYBENCH_3D_ARRAY_DECL(B_outputFromGpu,DATA_TYPE,NI,NJ,NK,ni,nj,nk);

	init(ni, nj, nk, POLYBENCH_ARRAY(A));

	DYNAMIC_BEGIN("CONV3D_init")
	read_cl_file(argv[3]);
	cl_initialization(platDev.platformId, platDev.deviceId);
	DYNAMIC_END
	
	
	DYNAMIC_BEGIN("CONV3D_xfer_to")
	cl_mem_init(POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
	cl_load_prog();
	DYNAMIC_END

	DYNAMIC_BEGIN("CONV3D_kernel")
	cl_launch_kernel(ni, nj, nk);
	DYNAMIC_END

	DYNAMIC_BEGIN("CONV3D_xfer_from")
	errcode = clEnqueueReadBuffer(clCommandQue, b_mem_obj, CL_TRUE, 0, NI * NJ * NK * sizeof(DATA_TYPE), POLYBENCH_ARRAY(B_outputFromGpu), 0, NULL, NULL);
	if(errcode != CL_SUCCESS) printf("Error in reading GPU mem\n");
	DYNAMIC_END

	#ifdef RUN_ON_CPU

		/* Start timer. */
	  	polybench_start_instruments;

		conv3D(ni, nj, nk, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(B));
	
		/* Stop and print timer. */
		printf("CPU Time in seconds:\n");
	  	polybench_stop_instruments;
	 	polybench_print_instruments;

		compareResults(ni, nj, nk, POLYBENCH_ARRAY(B), POLYBENCH_ARRAY(B_outputFromGpu));

	#else //prevent dead code elimination

		polybench_prevent_dce(print_array(ni, nj, nk, POLYBENCH_ARRAY(B_outputFromGpu)));

	#endif //RUN_ON_CPU

	DYNAMIC_BEGIN("CONV3D_cleanup")
	cl_clean_up();
	DYNAMIC_END

	POLYBENCH_FREE_ARRAY(A);
	POLYBENCH_FREE_ARRAY(B);
	POLYBENCH_FREE_ARRAY(B_outputFromGpu);

	return 0;
}



// CL INC

int get_global_id(int){return 0;}

void Convolution3D_kernel(DATA_TYPE *A, DATA_TYPE *B, int ni, int nj, int nk, int i)
{
    
	STATIC_BEGIN("CONV3D_KERNEL", (), ())
	int k = get_global_id(0);
	int j = get_global_id(1);
	
	DATA_TYPE c11, c12, c13, c21, c22, c23, c31, c32, c33;
	c11 = +2;  c21 = +5;  c31 = -8;
	c12 = -3;  c22 = +6;  c32 = -9;
	c13 = +4;  c23 = +7;  c33 = +10;
	
    	// Do the operation
    	if ((i < (ni - 1)) && (j < (nj - 1)) &&  (k < (nk - 1)) && (i > 0) && (j > 0) && (k > 0))
	{
		B[i*(nk * nj) + j*nk + k] = c11 * A[(i - 1)*(nk * nj) + (j - 1)*nk + (k - 1)]  +  c13 * A[(i + 1)*(nk * nj) + (j - 1)*nk + (k - 1)]
					     +   c21 * A[(i - 1)*(nk * nj) + (j - 1)*nk + (k - 1)]  +  c23 * A[(i + 1)*(nk * nj) + (j - 1)*nk + (k - 1)]
					     +   c31 * A[(i - 1)*(nk * nj) + (j - 1)*nk + (k - 1)]  +  c33 * A[(i + 1)*(nk * nj) + (j - 1)*nk + (k - 1)]
					     +   c12 * A[(i + 0)*(nk * nj) + (j - 1)*nk + (k + 0)]  +  c22 * A[(i + 0)*(nk * nj) + (j + 0)*nk + (k + 0)]   
					     +   c32 * A[(i + 0)*(nk * nj) + (j + 1)*nk + (k + 0)]  +  c11 * A[(i - 1)*(nk * nj) + (j - 1)*nk + (k + 1)]  
					     +   c13 * A[(i + 1)*(nk * nj) + (j - 1)*nk + (k + 1)]  +  c21 * A[(i - 1)*(nk * nj) + (j + 0)*nk + (k + 1)]  
					     +   c23 * A[(i + 1)*(nk * nj) + (j + 0)*nk + (k + 1)]  +  c31 * A[(i - 1)*(nk * nj) + (j + 1)*nk + (k + 1)]  
					     +   c33 * A[(i + 1)*(nk * nj) + (j + 1)*nk + (k + 1)];
	}
	else 
	{
		B[i*(nk * nj) + j*nk + k] = 0;
	}
	
	STATIC_END
}

