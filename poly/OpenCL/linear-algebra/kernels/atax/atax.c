/**
 * atax.c: This file is part of the PolyBench/GPU 1.0 test suite.
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

#ifdef __APPLE__
#include <OpenCL/opencl.h>
#else
#include <CL/cl.h>
#endif

#define POLYBENCH_TIME 1

//select the OpenCL device to use (can be GPU, CPU, or Accelerator such as Intel Xeon Phi)
#define OPENCL_DEVICE_SELECTION CL_DEVICE_TYPE_GPU

#include "atax.h"
#include <polybench.h>
#include <polybenchUtilFuncts.h>

//define the error threshold for the results "not matching"
#define PERCENT_DIFF_ERROR_THRESHOLD 0.05

#define MAX_SOURCE_SIZE (0x100000)

#ifndef M_PI
#define M_PI 3.14159
#endif

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
cl_command_queue clCommandQue;
cl_program clProgram;
cl_mem a_mem_obj;
cl_mem x_mem_obj;
cl_mem y_mem_obj;
cl_mem tmp_mem_obj;
FILE *fp;
char *source_str;
size_t source_size;

unsigned char *content;
const unsigned char *content_const;
size_t content_length;

#define RUN_ON_CPU


void compareResults(int ny, DATA_TYPE POLYBENCH_1D(z,NY,ny), DATA_TYPE POLYBENCH_1D(z_outputFromGpu,NY,ny))
{
    int i, fail;
    fail = 0;

    for (i=0; i<ny; i++)
    {
        if (percentDiff(z[i], z_outputFromGpu[i]) > PERCENT_DIFF_ERROR_THRESHOLD)
        {
            fail++;
        }       
    }
    
    // print results
    printf("Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\n", PERCENT_DIFF_ERROR_THRESHOLD, fail);
}


void read_cl_file(char* fileName)
{
    // Load the kernel source code into the array source_str
    /*fp = fopen("atax.cl", "r");
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


void init_array(int nx, int ny, DATA_TYPE POLYBENCH_1D(x,NX,nx), DATA_TYPE POLYBENCH_2D(A,NX,NY,nx,ny))
{
    int i, j;

    for (i = 0; i < nx; i++)
    {
        x[i] = i * M_PI;
        for (j = 0; j < ny; j++)
        {
            A[i][j] = ((DATA_TYPE) i*j) / NX;
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


void cl_mem_init(DATA_TYPE POLYBENCH_2D(A,NX,NY,nx,ny), DATA_TYPE POLYBENCH_1D(x,NY,ny), DATA_TYPE POLYBENCH_1D(y,NY,ny), DATA_TYPE POLYBENCH_1D(tmp,NX,nx))
{
    a_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, sizeof(DATA_TYPE) * NX * NY, NULL, &errcode);
    x_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, sizeof(DATA_TYPE) * NY, NULL, &errcode);
    y_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, sizeof(DATA_TYPE) * NY, NULL, &errcode);
    tmp_mem_obj = clCreateBuffer(clGPUContext, CL_MEM_READ_WRITE, sizeof(DATA_TYPE) * NX, NULL, &errcode);
        
    if(errcode != CL_SUCCESS) printf("Error in creating buffers\n");
    
    errcode = clEnqueueWriteBuffer(clCommandQue, a_mem_obj, CL_TRUE, 0, sizeof(DATA_TYPE) * NX * NY, A, 0, NULL, NULL);
    errcode = clEnqueueWriteBuffer(clCommandQue, x_mem_obj, CL_TRUE, 0, sizeof(DATA_TYPE) * NY, x, 0, NULL, NULL);
    errcode = clEnqueueWriteBuffer(clCommandQue, y_mem_obj, CL_TRUE, 0, sizeof(DATA_TYPE) * NY, y, 0, NULL, NULL);
    errcode = clEnqueueWriteBuffer(clCommandQue, tmp_mem_obj, CL_TRUE, 0, sizeof(DATA_TYPE) * NX, tmp, 0, NULL, NULL);
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
        
    // Create the 1st OpenCL kernel
    clKernel1 = clCreateKernel(clProgram, "atax_kernel1", &errcode);
    if(errcode != CL_SUCCESS) printf("Error in creating kernel\n");

    // Create the 2nd OpenCL kernel
    clKernel2 = clCreateKernel(clProgram, "atax_kernel2", &errcode);
    if(errcode != CL_SUCCESS) printf("Error in creating kernel\n");
    clFinish(clCommandQue);
}


void cl_launch_kernel(int nx, int ny)
{
    size_t localWorkSize[2], globalWorkSize[2];
    localWorkSize[0] = DIM_LOCAL_WORK_GROUP_X;
    localWorkSize[1] = DIM_LOCAL_WORK_GROUP_Y;
    globalWorkSize[0] = (size_t)ceil(((float)NX) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
    globalWorkSize[1] = 1;

    /* Start timer. */
    polybench_start_instruments;
    
    // Set the arguments of the kernel
    errcode =  clSetKernelArg(clKernel1, 0, sizeof(cl_mem), (void *)&a_mem_obj);
    errcode |= clSetKernelArg(clKernel1, 1, sizeof(cl_mem), (void *)&x_mem_obj);
    errcode |= clSetKernelArg(clKernel1, 2, sizeof(cl_mem), (void *)&tmp_mem_obj);
    errcode |= clSetKernelArg(clKernel1, 3, sizeof(int), (void *)&nx);
    errcode |= clSetKernelArg(clKernel1, 4, sizeof(int), (void *)&ny);
    if(errcode != CL_SUCCESS) printf("Error in setting arguments\n");

    DYNAMIC_BEGIN("ATAX_kernel_1")
    // Execute the OpenCL kernel
    errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel1, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
    if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");

    clEnqueueBarrier(clCommandQue);
    DYNAMIC_END

    globalWorkSize[0] = (size_t)ceil(((float)NY) / ((float)DIM_LOCAL_WORK_GROUP_X)) * DIM_LOCAL_WORK_GROUP_X;
    globalWorkSize[1] = 1;

    // Set the arguments of the kernel
    errcode =  clSetKernelArg(clKernel2, 0, sizeof(cl_mem), (void *)&a_mem_obj);
    errcode |= clSetKernelArg(clKernel2, 1, sizeof(cl_mem), (void *)&y_mem_obj);
    errcode |= clSetKernelArg(clKernel2, 2, sizeof(cl_mem), (void *)&tmp_mem_obj);
    errcode |= clSetKernelArg(clKernel2, 3, sizeof(int), (void *)&nx);
    errcode |= clSetKernelArg(clKernel2, 4, sizeof(int), (void *)&ny);
    if(errcode != CL_SUCCESS) printf("Error in seting arguments\n");

    DYNAMIC_BEGIN("ATAX_kernel_2")
    errcode = clEnqueueNDRangeKernel(clCommandQue, clKernel2, 1, NULL, globalWorkSize, localWorkSize, 0, NULL, NULL);
    

    if(errcode != CL_SUCCESS) printf("Error in launching kernel\n");
    clFinish(clCommandQue);
    DYNAMIC_END

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
    errcode = clReleaseKernel(clKernel1);
    errcode = clReleaseKernel(clKernel2);
    errcode = clReleaseProgram(clProgram);
    errcode = clReleaseMemObject(a_mem_obj);
    errcode = clReleaseMemObject(x_mem_obj);
    errcode = clReleaseMemObject(y_mem_obj);
    errcode = clReleaseMemObject(tmp_mem_obj);
    errcode = clReleaseCommandQueue(clCommandQue);
    errcode = clReleaseContext(clGPUContext);
    if(errcode != CL_SUCCESS) printf("Error in cleanup\n");
}


void atax_cpu(int nx, int ny, DATA_TYPE POLYBENCH_2D(A,NX,NY,nx,ny), DATA_TYPE POLYBENCH_1D(x,NY,ny), DATA_TYPE POLYBENCH_1D(y,NY,ny), 
        DATA_TYPE POLYBENCH_1D(tmp,NX,nx))
{
    int i,j;
    
    for (i= 0; i < _PB_NY; i++)
    {
            y[i] = 0;
    }
  
    for (i = 0; i < _PB_NX; i++)
    {
            tmp[i] = 0;

            for (j = 0; j < _PB_NY; j++)
        {
            tmp[i] = tmp[i] + A[i][j] * x[j];
        }
        
            for (j = 0; j < _PB_NY; j++)
        {
            y[j] = y[j] + A[i][j] * tmp[i];
        }
    }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int nx, DATA_TYPE POLYBENCH_1D(y,NX,nx))
{
  int i;

  for (i = 0; i < nx; i++) {
    fprintf (stderr, DATA_PRINTF_MODIFIER, y[i]);
    if (i % 20 == 0) fprintf (stderr, "\n");
  }
  fprintf (stderr, "\n");
}


int main(int argc, char *argv[])
{
    Components platDev = {-1,-1};
        platformAndDevice(argv[1],argv[2],&platDev);
        printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);

    int nx = NX;
    int ny = NY;

    POLYBENCH_2D_ARRAY_DECL(A,DATA_TYPE,NX,NY,nx,ny);
    POLYBENCH_1D_ARRAY_DECL(x,DATA_TYPE,NY,ny);
    POLYBENCH_1D_ARRAY_DECL(y,DATA_TYPE,NY,ny);
    POLYBENCH_1D_ARRAY_DECL(y_outputFromGpu,DATA_TYPE,NY,ny);
    POLYBENCH_1D_ARRAY_DECL(tmp,DATA_TYPE,NX,nx);

    init_array(nx, ny, POLYBENCH_ARRAY(x), POLYBENCH_ARRAY(A));

    DYNAMIC_BEGIN("ATAX_init")
    read_cl_file(argv[3]);
    cl_initialization(platDev.platformId, platDev.deviceId);
    DYNAMIC_END
    
    DYNAMIC_BEGIN("ATAX_xfer_to")
    cl_mem_init(POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(x), POLYBENCH_ARRAY(y), POLYBENCH_ARRAY(tmp));
    cl_load_prog();
    DYNAMIC_END

    cl_launch_kernel(nx, ny);

    DYNAMIC_BEGIN("ATAX_xfer_from")
    errcode = clEnqueueReadBuffer(clCommandQue, y_mem_obj, CL_TRUE, 0, NY*sizeof(DATA_TYPE), POLYBENCH_ARRAY(y_outputFromGpu), 0, NULL, NULL);
    DYNAMIC_END
    if(errcode != CL_SUCCESS) printf("Error in reading GPU mem\n");

    #ifdef RUN_ON_CPU

        /* Start timer. */
        polybench_start_instruments;

        atax_cpu(nx, ny, POLYBENCH_ARRAY(A), POLYBENCH_ARRAY(x), POLYBENCH_ARRAY(y), POLYBENCH_ARRAY(tmp));
    
        /* Stop and print timer. */
        printf("CPU Time in seconds:\n");
        polybench_stop_instruments;
        polybench_print_instruments;

        compareResults(ny, POLYBENCH_ARRAY(y), POLYBENCH_ARRAY(y_outputFromGpu));

    #else //prevent dead code elimination

        polybench_prevent_dce(print_array(ny, POLYBENCH_ARRAY(y_outputFromGpu)));

    #endif //RUN_ON_CPU

    DYNAMIC_BEGIN("ATAX_cleanup")
    cl_clean_up();
    DYNAMIC_END
    
    POLYBENCH_FREE_ARRAY(A);
    POLYBENCH_FREE_ARRAY(x);
    POLYBENCH_FREE_ARRAY(y);
    POLYBENCH_FREE_ARRAY(y_outputFromGpu);
    POLYBENCH_FREE_ARRAY(tmp);
    
    return 0;
}

/// CL included

/**
 * atax.cl: This file is part of the PolyBench/GPU 1.0 test suite.
 *
 *
 * Contact: Scott Grauer-Gray <sgrauerg@gmail.com>
 * Will Killian <killian@udel.edu>
 * Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://www.cse.ohio-state.edu/~pouchet/software/polybench/GPU
 */

int get_global_id(int){return 0;}



void atax_kernel1(DATA_TYPE *A, DATA_TYPE *x, DATA_TYPE *tmp, int nx, int ny) {
	STATIC_BEGIN("ATAX_kernel_1", (), ())
    
    int i = get_global_id(0);

    if (i < nx)
    {
        int j;
        for(j=0; j < ny; j++)
        {
            tmp[i] += A[i * ny + j] * x[j];
        }
    }
STATIC_END
}


void atax_kernel2(DATA_TYPE *A, DATA_TYPE *y, DATA_TYPE *tmp, int nx, int ny) {
STATIC_BEGIN("ATAX_kernel_2", (), ())
    
    int j = get_global_id(0);

    if (j < ny)
    {
        int i;
        for(i=0; i < nx; i++)
        {
            y[j] += A[i * ny + j] * tmp[i];
        }
    }
STATIC_END
}
 


