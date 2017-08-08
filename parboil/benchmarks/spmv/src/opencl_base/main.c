/***************************************************************************
 *cr
 *cr            (C) Copyright 2010 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

#include <CL/cl.h>
#include <CL/cl_ext.h>
#include <stdio.h>
#include <stdlib.h>
#include <parboil.h>



#include "file.h"
#include "gpu_info.h"
#include "ocl.h"
#include "convert_dataset.h"

static int generate_vector(float *x_vector, int dim) 
{	
	srand(54321);
	int i;
	for(i=0;i<dim;i++)
	{
		x_vector[i] = (rand() / (float) RAND_MAX);
	}
	return 0;
}

int main(int argc, char** argv) {
	struct pb_TimerSet timers;
	struct pb_Parameters *parameters;
	Components platDev = {-1,-1};
	printf("CUDA accelerated sparse matrix vector multiplication****\n");
	printf("Original version by Li-Wen Chang <lchang20@illinois.edu> and Shengzhao Wu<wu14@illinois.edu>\n");
	printf("This version maintained by Chris Rodrigues  ***********\n");
	DYNAMIC_BEGIN("spmv_initialize_cl_objects")
	platformAndDevice(argv[3],argv[4],&platDev);
	printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);

  	FILE * file = fopen(argv[5], "rb"); 
	if(!file) { printf("ERROR: unable to open '%s'\n", argv[5]); return -1; }
	//fread(source + strlen(source), sourcesize, 1, fp);
	size_t content_length;
	unsigned char *content = read_file(file, &content_length);
	const unsigned char *content_const = content; // nasty; only to keep clCreateProgramWithBinary from complaining about incompatible pointer types
	fclose(file);

	parameters = pb_ReadParameters(&argc, argv);
	if ((parameters->inpFiles[0] == NULL) || (parameters->inpFiles[1] == NULL) || (parameters->inpFiles[2] == NULL) )
    	{
      		fprintf(stderr, "Expecting two input filename and deviceType No. [CPU:1 GPU:0]\n");
      		exit(-1);
    	}

	pb_InitializeTimerSet(&timers);
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
	//parameters declaration
	cl_int clStatus;
	cl_platform_id clPlatform;
	//clStatus = clGetPlatformIDs(1,&clPlatform,NULL);
	//CHECK_ERROR("clGetPlatformIDs")

	//cl_context_properties clCps[3] = {CL_CONTEXT_PLATFORM,(cl_context_properties)clPlatform,0};
	//bool isCPU = atoi(parameters->inpFiles[2]);
	cl_device_id clDevice;
        /*if (isCPU)
	    clStatus = clGetDeviceIDs(clPlatform,CL_DEVICE_TYPE_CPU,1,&clDevice,NULL);
        else
            clStatus = clGetDeviceIDs(clPlatform,CL_DEVICE_TYPE_GPU,1,&clDevice,NULL);*/

	cl_uint platform_index = platDev.platformId;
	cl_uint device_index = platDev.deviceId;

	cl_uint platform_count;
	clStatus = clGetPlatformIDs(0, NULL, &platform_count);

	cl_platform_id *platforms = (cl_platform_id*)malloc(platform_count * sizeof(cl_platform_id));
	clStatus = clGetPlatformIDs(platform_count, platforms, NULL);

	clPlatform = platforms[platform_index];
	free(platforms);
	
	cl_uint device_count;
	clStatus = clGetDeviceIDs(clPlatform, CL_DEVICE_TYPE_ALL, 0, NULL, &device_count);

	cl_device_id *devices = (cl_device_id*)malloc(device_count * sizeof(cl_device_id));
	clStatus = clGetDeviceIDs(clPlatform, CL_DEVICE_TYPE_ALL, device_count, devices, NULL);

	clDevice = devices[device_index];//
    	free(devices);

	CHECK_ERROR("clGetDeviceIDs")

	cl_context clContext;
        /*if (isCPU)
            clContext = clCreateContextFromType(clCps,CL_DEVICE_TYPE_CPU,NULL,NULL,&clStatus);
	else
            clContext =  clCreateContextFromType(clCps,CL_DEVICE_TYPE_GPU,NULL,NULL,&clStatus);*/
	clContext = clCreateContext(0, 1, &clDevice, NULL, NULL, &clStatus);

        CHECK_ERROR("clCreateContextFromType")

	cl_command_queue clCommandQueue = clCreateCommandQueue(clContext,clDevice,CL_QUEUE_PROFILING_ENABLE,&clStatus);
	CHECK_ERROR("clCreateCommandQueue")

  	pb_SetOpenCL(&clContext, &clCommandQueue);
	
	const char* clSource[] = {readFile("src/opencl_base/kernel.cl")};
	//cl_program clProgram = clCreateProgramWithSource(clContext,1,clSource,NULL,&clStatus);
	cl_program clProgram = clCreateProgramWithBinary(clContext, 1, &clDevice, &content_length, &content_const, 0, &clStatus);	
	CHECK_ERROR("clCreateProgramWithSource")

	char clOptions[50];
	sprintf(clOptions,"");
	//clStatus = clBuildProgram(clProgram,1,&clDevice,clOptions,NULL,NULL);
	clStatus = clBuildProgram(clProgram, 0, NULL, NULL, NULL, NULL);
	CHECK_ERROR("clBuildProgram")

	cl_kernel clKernel = clCreateKernel(clProgram,"spmv_jds_naive",&clStatus);
	CHECK_ERROR("clCreateKernel")
	DYNAMIC_END
	int len;
	int depth;
	int dim;
	int pad=32;
	int nzcnt_len;
	
	//host memory allocation
	//matrix
	float *h_data;
	int *h_indices;
	int *h_ptr;
	int *h_perm;
	int *h_nzcnt;
	//vector
	float *h_Ax_vector;
	float *h_x_vector;
	
	//device memory allocation
	//matrix
	cl_mem d_data;
	cl_mem d_indices;
	cl_mem d_ptr;
	cl_mem d_perm;
	cl_mem d_nzcnt;

	//vector
	cl_mem d_Ax_vector;
	cl_mem d_x_vector;
	
	cl_mem jds_ptr_int;
	cl_mem sh_zcnt_int;

    	//load matrix from files
	pb_SwitchToTimer(&timers, pb_TimerID_IO);
	//inputData(parameters->inpFiles[0], &len, &depth, &dim,&nzcnt_len,&pad,
	//    &h_data, &h_indices, &h_ptr,
	//    &h_perm, &h_nzcnt);
	int col_count;
	coo_to_jds(
		parameters->inpFiles[0], // bcsstk32.mtx, fidapm05.mtx, jgl009.mtx
		1, // row padding
		pad, // warp size
		1, // pack size
		1, // is mirrored?
		0, // binary matrix
		1, // debug level [0:2]
		&h_data, &h_ptr, &h_nzcnt, &h_indices, &h_perm,
		&col_count, &dim, &len, &nzcnt_len, &depth
	);
	
//	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	h_Ax_vector=(float*)malloc(sizeof(float)*dim);	
	h_x_vector=(float*)malloc(sizeof(float)*dim);	
	
  input_vec( parameters->inpFiles[1],h_x_vector,dim);

	 pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
    	OpenCLDeviceProp clDeviceProp;
//	clStatus = clGetDeviceInfo(clDevice,CL_DEVICE_COMPUTE_CAPABILITY_MAJOR_NV,sizeof(cl_uint),&(clDeviceProp.major),NULL);
	//CHECK_ERROR("clGetDeviceInfo")
//	clStatus = clGetDeviceInfo(clDevice,CL_DEVICE_COMPUTE_CAPABILITY_MINOR_NV,sizeof(cl_uint),&(clDeviceProp.minor),NULL);
  //      CHECK_ERROR("clGetDeviceInfo")
	DYNAMIC_BEGIN("spmv_kernel_profiling")
	clStatus = clGetDeviceInfo(clDevice,CL_DEVICE_MAX_COMPUTE_UNITS,sizeof(cl_uint),&(clDeviceProp.multiProcessorCount),NULL);
        CHECK_ERROR("clGetDeviceInfo")
	DYNAMIC_END
	pb_SwitchToTimer(&timers, pb_TimerID_COPY);
	//memory allocation
	DYNAMIC_BEGIN("spmv_initialize_cl_objects")
	d_data = clCreateBuffer(clContext,CL_MEM_READ_ONLY,len*sizeof(float),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")
	d_indices = clCreateBuffer(clContext,CL_MEM_READ_ONLY,len*sizeof(int),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")
	d_perm = clCreateBuffer(clContext,CL_MEM_READ_ONLY,dim*sizeof(int),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")
	d_x_vector = clCreateBuffer(clContext,CL_MEM_READ_ONLY,dim*sizeof(float),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")
	d_Ax_vector = clCreateBuffer(clContext,CL_MEM_WRITE_ONLY,dim*sizeof(float),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")

	jds_ptr_int = clCreateBuffer(clContext,CL_MEM_READ_ONLY,5000*sizeof(int),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")
	sh_zcnt_int = clCreateBuffer(clContext,CL_MEM_READ_ONLY,5000*sizeof(int),NULL,&clStatus);
	CHECK_ERROR("clCreateBuffer")
	DYNAMIC_END
	clMemSet(clCommandQueue,d_Ax_vector,0,dim*sizeof(float));
		
	//memory copy
	DYNAMIC_BEGIN("spmv_transfer_data_from_host_to_device")
	clStatus = clEnqueueWriteBuffer(clCommandQueue,d_data,CL_FALSE,0,len*sizeof(float),h_data,0,NULL,NULL);
	CHECK_ERROR("clEnqueueWriteBuffer")
	clStatus = clEnqueueWriteBuffer(clCommandQueue,d_indices,CL_FALSE,0,len*sizeof(int),h_indices,0,NULL,NULL);
	CHECK_ERROR("clEnqueueWriteBuffer")
	clStatus = clEnqueueWriteBuffer(clCommandQueue,d_perm,CL_FALSE,0,dim*sizeof(int),h_perm,0,NULL,NULL);
	CHECK_ERROR("clEnqueueWriteBuffer")
	clStatus = clEnqueueWriteBuffer(clCommandQueue,d_x_vector,CL_FALSE,0,dim*sizeof(int),h_x_vector,0,NULL,NULL);
	CHECK_ERROR("clEnqueueWriteBuffer")

	clStatus = clEnqueueWriteBuffer(clCommandQueue,jds_ptr_int,CL_FALSE,0,depth*sizeof(int),h_ptr,0,NULL,NULL);
	CHECK_ERROR("clEnqueueWriteBuffer")
	clStatus = clEnqueueWriteBuffer(clCommandQueue,sh_zcnt_int,CL_TRUE,0,nzcnt_len*sizeof(int),h_nzcnt,0,NULL,NULL);
	CHECK_ERROR("clEnqueueWriteBuffer")
	DYNAMIC_END
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
	size_t grid;
	size_t block;

	compute_active_thread(&block,&grid,nzcnt_len,pad,clDeviceProp.major,clDeviceProp.minor,clDeviceProp.multiProcessorCount);
//  printf("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!grid is %d and block is %d=\n",grid,block);
//  printf("!!! dim is %d\n",dim);
	DYNAMIC_BEGIN("spmv_kernel")
	STATIC_BEGIN("spmv_kernel", (dim, h_nzcnt, h_ptr, h_indices, h_data, h_x_vector, h_perm, h_Ax_vector), (h_Ax_vector))
	clStatus = clSetKernelArg(clKernel,0,sizeof(cl_mem),&d_Ax_vector);
	CHECK_ERROR("clSetKernelArg")
	clStatus = clSetKernelArg(clKernel,1,sizeof(cl_mem),&d_data);
	CHECK_ERROR("clSetKernelArg")
	clStatus = clSetKernelArg(clKernel,2,sizeof(cl_mem),&d_indices);
	CHECK_ERROR("clSetKernelArg")
	clStatus = clSetKernelArg(clKernel,3,sizeof(cl_mem),&d_perm);
	CHECK_ERROR("clSetKernelArg")
	clStatus = clSetKernelArg(clKernel,4,sizeof(cl_mem),&d_x_vector);
	CHECK_ERROR("clSetKernelArg")
	clStatus = clSetKernelArg(clKernel,5,sizeof(int),&dim);
	CHECK_ERROR("clSetKernelArg")

	clStatus = clSetKernelArg(clKernel,6,sizeof(cl_mem),&jds_ptr_int);
	CHECK_ERROR("clSetKernelArg")
	clStatus = clSetKernelArg(clKernel,7,sizeof(cl_mem),&sh_zcnt_int);
        CHECK_ERROR("clSetKernelArg")

	//main execution
	pb_SwitchToTimer(&timers, pb_TimerID_KERNEL);

	
	int i;
	for (i=0; i<50; i++)
	{
		clStatus = clEnqueueNDRangeKernel(clCommandQueue,clKernel,1,NULL,&grid,&block,0,NULL,NULL);
		CHECK_ERROR("clEnqueueNDRangeKernel")
	}

	clStatus = clFinish(clCommandQueue);
	CHECK_ERROR("clFinish")
	
	STATIC_END
	DYNAMIC_END
	
	pb_SwitchToTimer(&timers, pb_TimerID_COPY);
	//HtoD memory copy
	DYNAMIC_BEGIN("spmv_transfer_data_from_device_to_host")
	clStatus = clEnqueueReadBuffer(clCommandQueue,d_Ax_vector,CL_TRUE,0,dim*sizeof(float),h_Ax_vector,0,NULL,NULL);
	CHECK_ERROR("clEnqueueReadBuffer")	
	DYNAMIC_END
	DYNAMIC_BEGIN("spmv_release_cl_resources")
	clStatus = clReleaseKernel(clKernel);
	clStatus = clReleaseProgram(clProgram);

	clStatus = clReleaseMemObject(d_data);
	clStatus = clReleaseMemObject(d_indices);
        clStatus = clReleaseMemObject(d_perm);
	clStatus = clReleaseMemObject(d_nzcnt);
        clStatus = clReleaseMemObject(d_x_vector);
	clStatus = clReleaseMemObject(d_Ax_vector);
	CHECK_ERROR("clReleaseMemObject")

	clStatus = clReleaseCommandQueue(clCommandQueue);
	clStatus = clReleaseContext(clContext);	
	DYNAMIC_END
	if (parameters->outFile) {
		pb_SwitchToTimer(&timers, pb_TimerID_IO);
		outputData(parameters->outFile,h_Ax_vector,dim);
	}

	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
	free((void*)clSource[0]);
	
	free (h_data);
	free (h_indices);
	free (h_ptr);
	free (h_perm);
	free (h_nzcnt);
	free (h_Ax_vector);
	free (h_x_vector);
	pb_SwitchToTimer(&timers, pb_TimerID_NONE);

	pb_PrintTimerSet(&timers);
	pb_FreeParameters(parameters);

	return 0;
}
