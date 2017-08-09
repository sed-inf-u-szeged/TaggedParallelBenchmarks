# Tagged Parallel Benchmarks #

This repository contains tagged versions of parts of the following 3 well-known benchmark suites:
(For individual readmes, refer to the corresponding subdirectories.)

- [Parboil](http://impact.crhc.illinois.edu/parboil/parboil.aspx)
- [Rodinia](http://lava.cs.virginia.edu/wiki/rodinia)
- [Polybench/ACC](https://github.com/cavazos-lab/PolyBench-ACC)

## Tagging ##

Tagging in this context means `STATIC_BEGIN` / `STATIC_END` and `DYNAMIC_BEGIN` / `DYNAMIC_END` macro pairs at specific locations in the source code.
Static macros only aim to capture the kernel functionalities while dynamic macros separate initialization/cleanup, data transfer (to and from), and kernel regions to enable individual measurements.
The expansion of these macros is completely customizable, e.g., `STATIC_BEGIN` and `STATIC_END` could create a block tagged with a C++11 attribute which would help in identifying the block during static source code analysis while `DYNAMIC_BEGIN` and `DYNAMIC_END` could call a measurement library.

## Platform Selection ##

Some OpenCL benchmarks have been modified to be able to take the target platform/device pair and also a pre-built kernel binary from the command line.
The corresponding helper functionality is implemented in `platform_helper.h`.

## License ##

Please refer to the licenses of the individual benchmark suites. There is no common license. When in doubt or you don't know what you're doing, please use the BSD or MIT license.
