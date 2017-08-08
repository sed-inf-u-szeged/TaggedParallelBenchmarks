/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

/* 
 * C code for creating the Q data structure for fast convolution-based 
 * Hessian multiplication for arbitrary k-space trajectories.
 *
 * Inputs:
 * kx - VECTOR of kx values, same length as ky and kz
 * ky - VECTOR of ky values, same length as kx and kz
 * kz - VECTOR of kz values, same length as kx and ky
 * x  - VECTOR of x values, same length as y and z
 * y  - VECTOR of y values, same length as x and z
 * z  - VECTOR of z values, same length as x and y
 * phi - VECTOR of the Fourier transform of the spatial basis 
 *      function, evaluated at [kx, ky, kz].  Same length as kx, ky, and kz.
 *
 * recommended g++ options:
 *  -O3 -lm -ffast-math -funroll-all-loops
 */

#include <stdio.h>
#include <sys/time.h>
#include <parboil.h>
#include <CL/cl.h>

#include "ocl.h"
#include "file.h"
#include "macros.h"
#include "computeQ.h"

static void
setupMemoryGPU(int num, int size, cl_mem* dev_ptr, float* host_ptr,clPrmtr* clPrm)
{
  cl_int clStatus;
  DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
  *dev_ptr = clCreateBuffer(clPrm->clContext,CL_MEM_READ_ONLY,num*size,NULL,&clStatus);
  DYNAMIC_END
  CHECK_ERROR("clCreateBuffer");
  DYNAMIC_BEGIN("mri-q_transfer_data_from_host_to_device")
  clStatus = clEnqueueWriteBuffer(clPrm->clCommandQueue,*dev_ptr,CL_TRUE,0,num*size,host_ptr,0,NULL,NULL);
  DYNAMIC_END
  CHECK_ERROR("clEnequeueWriteBuffer");
}

static void
cleanupMemoryGPU(int num, int size, cl_mem* dev_ptr, float* host_ptr, clPrmtr* clPrm)
{
  cl_int clStatus;
  DYNAMIC_BEGIN("mri-q_transfer_data_from_device_to_host")
  clStatus = clEnqueueReadBuffer(clPrm->clCommandQueue,*dev_ptr,CL_TRUE,0,num*size,host_ptr,0,NULL,NULL);
  DYNAMIC_END
  CHECK_ERROR("clEnqueueReadBuffer")
  DYNAMIC_BEGIN("mri-q_release_cl_resources")
  clStatus = clReleaseMemObject(*dev_ptr);
  DYNAMIC_END
  CHECK_ERROR("clReleaseMemObject")
}

int
main (int argc, char *argv[]) {
  Components platDev = {-1,-1};
  int numX, numK;		/* Number of X and K values */
  int original_numK;		/* Number of K values in input file */
  float *kx, *ky, *kz;		/* K trajectory (3D vectors) */
  float *x, *y, *z;		/* X coordinates (3D vectors) */
  float *phiR, *phiI;		/* Phi values (complex) */
  float *phiMag;		/* Magnitude of Phi */
  float *Qr, *Qi;		/* Q signal (complex) */

  struct kValues* kVals;

  struct pb_Parameters *params;
  struct pb_TimerSet timers;

  pb_InitializeTimerSet(&timers);
 
  

  /* Read command line */
  platformAndDevice(argv[4],argv[5],&platDev);
  printf("Platform:%d, Device:%d\n",platDev.platformId,platDev.deviceId);

	FILE * fp = fopen(argv[6], "rb"); 
	if(!fp) { printf("ERROR: unable to open '%s'\n", argv[6]); return -1; }
	//fread(source + strlen(source), sourcesize, 1, fp);
	size_t content_length;
	unsigned char *content = read_file(fp, &content_length);
	const unsigned char *content_const = content; // nasty; only to keep clCreateProgramWithBinary from complaining about incompatible pointer types
	fclose(fp);

  params = pb_ReadParameters(&argc, argv);
  if ((params->inpFiles[0] == NULL) || (params->inpFiles[1] == NULL) || (params->inpFiles[2] != NULL))
    {
      fprintf(stderr, "Expecting one input filename and deviceType No.  [CPU:1 ,  GPU: 0]\n");
      exit(-1);
    }
   bool isCPU = atoi(params->inpFiles[1] );  
  /* Read in data */
  pb_SwitchToTimer(&timers, pb_TimerID_IO);
  inputData(params->inpFiles[0],
	    &original_numK, &numX,
	    &kx, &ky, &kz,
	    &x, &y, &z,
	    &phiR, &phiI);

  /* Reduce the number of k-space samples if a number is given
   * on the command line */
  if (argc < 2)
    numK = original_numK;
  else
    {
      int inputK;
      char *end;
      inputK = strtol(argv[1], &end, 10);
      if (end == argv[1])
	{
	  fprintf(stderr, "Expecting an integer parameter\n");
	  exit(-1);
	}

      numK = MIN(inputK, original_numK);
    }

  printf("%d pixels in output; %d samples in trajectory; using %d samples\n",
         numX, original_numK, numK);

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  clPrmtr clPrm;

  cl_uint platform_index = platDev.platformId;
  cl_uint device_index = platDev.deviceId;
  cl_int clStatus;
  cl_platform_id cpPlatform;
  DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
  clStatus = clGetPlatformIDs(1,&cpPlatform,NULL);
  CHECK_ERROR("clGetPlatformIDs")

  //cl_context_properties cps[3] = {CL_CONTEXT_PLATFORM,(cl_context_properties)cpPlatform,0};

  cl_device_id cdDevice;
  /*if (isCPU)
      clStatus = clGetDeviceIDs(cpPlatform,CL_DEVICE_TYPE_CPU,1,&cdDevice,NULL);
  else
      clStatus = clGetDeviceIDs(cpPlatform,CL_DEVICE_TYPE_GPU,1,&cdDevice,NULL);*/

  cl_uint platform_count; 
  clStatus = clGetPlatformIDs(0, NULL, &platform_count); 
  
  cl_platform_id *platforms = (cl_platform_id*)malloc(platform_count * sizeof(cl_platform_id));

  clStatus = clGetPlatformIDs(platform_count, platforms, NULL);

  cl_platform_id platform_id = platforms[platform_index];
  free(platforms);

  cl_uint device_count;
  clStatus = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ALL, 0, NULL, &device_count);

  cl_device_id *devices = (cl_device_id*)malloc(device_count * sizeof(cl_device_id));

  clStatus = clGetDeviceIDs(platform_id, CL_DEVICE_TYPE_ALL, device_count, devices, NULL);

  cdDevice = devices[device_index];
  free(devices);


  
  CHECK_ERROR("clGetDeviceIDs")
  /*if (isCPU)
      clPrm.clContext = clCreateContextFromType(cps,CL_DEVICE_TYPE_CPU,NULL,NULL,&clStatus);
  else
     clPrm.clContext = clCreateContextFromType(cps,CL_DEVICE_TYPE_GPU,NULL,NULL,&clStatus);*/
  clPrm.clContext = clCreateContext(0, 1, &cdDevice, NULL, NULL, &clStatus);
  CHECK_ERROR("clCreateContextFromType")

  clPrm.clCommandQueue = clCreateCommandQueue(clPrm.clContext,cdDevice,CL_QUEUE_PROFILING_ENABLE,&clStatus);
  CHECK_ERROR("clCreateCommandQueue")

  pb_SetOpenCL(&(clPrm.clContext), &(clPrm.clCommandQueue));

  const char* clSource[] = {readFile("src/opencl/kernels.cl")};
  //cl_program clProgram = clCreateProgramWithSource(clPrm.clContext,1,clSource,NULL,&clStatus);
  cl_program clProgram = clCreateProgramWithBinary(clPrm.clContext, 1, &cdDevice, &content_length, &content_const, 0, &clStatus);
  CHECK_ERROR("clCreateProgramWithSource")

  char options[50];
  sprintf(options,"-I src/opencl_nvidia");
  clStatus = clBuildProgram(clProgram,0,NULL,options,NULL,NULL);
  
  if (clStatus != CL_SUCCESS) {
    char buf[4096];
    DYNAMIC_END
    DYNAMIC_BEGIN("mri-q_kernel_profiling")
    clGetProgramBuildInfo(clProgram, cdDevice, CL_PROGRAM_BUILD_LOG, 4096, buf, NULL);
    DYNAMIC_END
    DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
    printf ("%s\n", buf);
    CHECK_ERROR("clBuildProgram")
  }
  
  /* Create CPU data structures */
  createDataStructsCPU(numK, numX, &phiMag, &Qr, &Qi);

  /* GPU section 1 (precompute PhiMag) */
  {
    clPrm.clKernel = clCreateKernel(clProgram,"ComputePhiMag_GPU",&clStatus);
    CHECK_ERROR("clCreateKernel")    
    DYNAMIC_END
    /* Mirror several data structures on the device */
    cl_mem phiR_d;
    cl_mem phiI_d;
    cl_mem phiMag_d;

    pb_SwitchToTimer(&timers, pb_TimerID_COPY);
    
    setupMemoryGPU(numK,sizeof(float),&phiR_d,phiR,&clPrm);
    setupMemoryGPU(numK,sizeof(float),&phiI_d,phiI,&clPrm);
    DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
    phiMag_d = clCreateBuffer(clPrm.clContext,CL_MEM_WRITE_ONLY,numK*sizeof(float),NULL,&clStatus);
    CHECK_ERROR("clCreateBuffer")
    clStatus = clFinish(clPrm.clCommandQueue);
    DYNAMIC_END
    CHECK_ERROR("clFinish")

    pb_SwitchToTimer(&timers, pb_TimerID_KERNEL);


    computePhiMag_GPU(numK, phiR_d, phiI_d, phiMag_d, &clPrm);
    
    DYNAMIC_BEGIN("mri-q_kernel_computePhiMagGPU")
    STATIC_BEGIN("mri-q_kernel_computePhiMagGPU", (numK, phiR, phiI, phiMag), (phiMag))
    clStatus = clFinish(clPrm.clCommandQueue);
    STATIC_END
    DYNAMIC_END
    CHECK_ERROR("clFinish")

    pb_SwitchToTimer(&timers, pb_TimerID_COPY);

    cleanupMemoryGPU(numK,sizeof(float),&phiMag_d,phiMag,&clPrm);
    DYNAMIC_BEGIN("mri-q_release_cl_resources")
    clStatus = clReleaseMemObject(phiR_d);
    CHECK_ERROR("clReleaseMemObject")
    clStatus = clReleaseMemObject(phiI_d);
    CHECK_ERROR("clReleaseMemObject")
    DYNAMIC_END
  }

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  kVals = (struct kValues*)calloc(numK, sizeof (struct kValues));

  int k;
  for (k = 0; k < numK; k++) {
    kVals[k].Kx = kx[k];
    kVals[k].Ky = ky[k];
    kVals[k].Kz = kz[k];
    kVals[k].PhiMag = phiMag[k];
  }

  free(phiMag);
  DYNAMIC_BEGIN("mri-q_release_cl_resources")
  clStatus = clReleaseKernel(clPrm.clKernel);
  DYNAMIC_END
  /* GPU section 2 */
  {
    //DYNAMIC_BEGIN("mri-q_release_cl_resources")
    DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
    clPrm.clKernel = clCreateKernel(clProgram,"ComputeQ_GPU",&clStatus);
    CHECK_ERROR("clCreateKernel")
    DYNAMIC_END

    cl_mem x_d;
    cl_mem y_d;
    cl_mem z_d;
    cl_mem Qr_d;
    cl_mem Qi_d;

    pb_SwitchToTimer(&timers, pb_TimerID_COPY);

    setupMemoryGPU(numX,sizeof(float),&x_d,x,&clPrm);
    setupMemoryGPU(numX,sizeof(float),&y_d,y,&clPrm);
    setupMemoryGPU(numX,sizeof(float),&z_d,z,&clPrm);
    DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
    Qr_d = clCreateBuffer(clPrm.clContext,CL_MEM_READ_WRITE,numX*sizeof(float),NULL,&clStatus);
    CHECK_ERROR("clCreateBuffer")
    DYNAMIC_END
    clMemSet(&clPrm,Qr_d,0,numX*sizeof(float));
    DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
    Qi_d = clCreateBuffer(clPrm.clContext,CL_MEM_READ_WRITE,numX*sizeof(float),NULL,&clStatus);
    DYNAMIC_END
    CHECK_ERROR("clCreateBuffer")
    clMemSet(&clPrm,Qi_d,0,numX*sizeof(float));
    DYNAMIC_BEGIN("mri-q_initialize_cl_objects")
    clStatus = clFinish(clPrm.clCommandQueue);
    DYNAMIC_END
    CHECK_ERROR("clFinish")

    pb_SwitchToTimer(&timers, pb_TimerID_KERNEL);

    computeQ_GPU(numK, numX, x_d, y_d, z_d, kVals, Qr_d, Qi_d, &clPrm);

    DYNAMIC_BEGIN("mri-q_kernel_computeQGPU")
    STATIC_BEGIN("mri-q_kernel_computeQGPU", (numK, numX, kVals, x, y, z, Qr, Qi), (Qr, Qi))
    clStatus = clFinish(clPrm.clCommandQueue);
    STATIC_END
    DYNAMIC_END
    CHECK_ERROR("clFinish")

    pb_SwitchToTimer(&timers, pb_TimerID_COPY);
    DYNAMIC_BEGIN("mri-q_release_cl_objects")
    clStatus = clReleaseMemObject(x_d);
    CHECK_ERROR("clReleaseMemObject")
    clStatus = clReleaseMemObject(y_d);
    CHECK_ERROR("clReleaseMemObject")
    clStatus = clReleaseMemObject(z_d);
    CHECK_ERROR("clReleaseMemObject")
    DYNAMIC_END
    cleanupMemoryGPU(numX,sizeof(float),&Qr_d,Qr,&clPrm);
    cleanupMemoryGPU(numX,sizeof(float),&Qi_d,Qi,&clPrm);
  }

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  if (params->outFile)
    {
      /* Write Q to file */
      pb_SwitchToTimer(&timers, pb_TimerID_IO);
      outputData(params->outFile, Qr, Qi, numX);
      pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
    }

  free (kx);
  free (ky);
  free (kz);
  free (x);
  free (y);
  free (z);
  free (phiR);
  free (phiI);
  free (kVals);
  free (Qr);
  free (Qi);

  free((void*)clSource[0]);
  DYNAMIC_BEGIN("mri-q_release_cl_objects")
  clStatus = clReleaseKernel(clPrm.clKernel);
  clStatus = clReleaseProgram(clProgram);
  clStatus = clReleaseCommandQueue(clPrm.clCommandQueue);
  clStatus = clReleaseContext(clPrm.clContext);
  DYNAMIC_END
  pb_SwitchToTimer(&timers, pb_TimerID_NONE);
  pb_PrintTimerSet(&timers);

  pb_FreeParameters(params);

  return 0;
}
