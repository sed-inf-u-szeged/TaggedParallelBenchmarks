#ifndef PLATFORM_HELPER_H_INCLUDED
#define PLATFORM_HELPER_H_INCLUDED

#include <CL/cl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h> 
#include <string.h>

#define CHUNK_SIZE 1024

inline static char* read_file(FILE *in_file, size_t *length_ret) {
	char *buffer = NULL;
	int chunk_count = 0;
	size_t length = 0;
	while (1) {
		chunk_count++;
	        buffer = (char*)realloc(buffer, chunk_count * CHUNK_SIZE);
	        if (buffer == NULL){
	            printf("Error: Out of memory");
	        }

		size_t cnt = fread(buffer + ((chunk_count - 1) * CHUNK_SIZE), sizeof(char), CHUNK_SIZE, in_file);
	        length += cnt;

	        if (cnt < CHUNK_SIZE) {
		        if (ferror(in_file)){
 		 	       printf("Error: reading input (errno: %d)", errno);
                		exit(EXIT_FAILURE);
            		}
            	break;
        	}
    	}

	*length_ret = length;
	return buffer;
}

struct Components_s
{
    int platformId;
    int deviceId;
};
typedef struct Components_s Components;

inline bool prefixCheck(const char *pre, const char *str)
{
    size_t lenpre = strlen(pre),
           lenstr = strlen(str);
    return lenstr < lenpre ? false : strncmp(pre, str, lenpre) == 0;
}


inline void platformAndDevice(const char* platform,const char* device, Components* val){
    	unsigned int i, j;
    	cl_platform_id platforms[32];
    	cl_uint num_platforms;
    	char platform_name[1024];
    	cl_device_id devices[32];
    	cl_uint num_devices;
    	char device_name[1024];

    	clGetPlatformIDs (32, platforms, &num_platforms);    
    	for(i = 0; i < num_platforms; i++){
		clGetPlatformInfo (platforms[i], CL_PLATFORM_NAME, sizeof(platform_name), platform_name, NULL);
		//if(strstr(platform_name,platform) != NULL){
		if(prefixCheck(platform,platform_name)){
			val->platformId = i;
			clGetDeviceIDs (platforms[i], CL_DEVICE_TYPE_ALL, sizeof(devices), devices, &num_devices);
			for(j = 0; j < num_devices; j++){
				clGetDeviceInfo(devices[j], CL_DEVICE_NAME, sizeof(device_name), device_name, NULL);
				//if(strstr(device_name,device) != NULL){
				if(prefixCheck(device,device_name)){
					val->deviceId = j;
					return;
				}
			}
		}
    	}


	return;
}

#endif // PLATFORM_HELPER_H_INCLUDED
