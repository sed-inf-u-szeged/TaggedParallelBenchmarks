#!/bin/bash
# example run with fpga
./build/opencl_base_default/spmv -i ../../datasets/spmv/large/input/Dubcova3.mtx.bin,../../datasets/spmv/large/input/vector.bin,1 xilinx fpga ./src/opencl_base/kernel_xilinx_fpga.xclbin
