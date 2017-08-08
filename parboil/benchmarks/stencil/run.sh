#!/bin/bash
# example run with cpu
./build/opencl_base_default/stencil -i ../../datasets/stencil/default/input/512x512x64x100.bin -- 512 512 64 2 1 AMD Intel ./src/opencl_base/kernel_amd_intel.clbin
