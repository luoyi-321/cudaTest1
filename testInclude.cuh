#define _USE_MATH_DEFINES

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdio.h>
#include <iostream>
#include <complex>
#include <cmath>
#include <vector>
#include <Eigen/Dense>
#include <string>
#include <map>
#define EPSILON 1.0e-15
#define NUM_BINS 2048

#include <chrono>

#include <fstream>
#include <sstream>

#include <cuComplex.h> 
#include <thrust/complex.h>


#define M_PI 3.141592653589793
#define blockSize 1024
#define TARGETNUM 4194304
#define NRN 2048
#define TILE_SIZE 32 
#define LEN 45



// typedef std::complex<double> Complex;

#define CUDA_CHECK(call) \
    if((call) != cudaSuccess) { \
        cudaError_t err = cudaGetLastError(); \
        cerr << "CUDA error at \"" #call "\", error code mean " << cudaGetErrorString(err) << endl; \
        exit(EXIT_FAILURE); \
    }



using namespace std;
using namespace Eigen;




#define CUDA_CHECK(call) \
    if((call) != cudaSuccess) { \
        cudaError_t err = cudaGetLastError(); \
        cerr << "CUDA error at \"" #call "\", error code mean " << cudaGetErrorString(err) << endl; \
        exit(EXIT_FAILURE); \
    }
