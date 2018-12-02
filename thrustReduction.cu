//
// This code is based on code from:
// https://en.cppreference.com/w/cpp/algorithm/reduce
// and
//
// This code uses a GPU and thrust to perform a reduction
//
#include <iostream>
#include <chrono>
#include <vector>
#include <numeric>
#include <thrust/reduce.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
#include <thrust/host_vector.h>


 
int main(int argc,char *argv[])
{
    if (argc!=2) {
	std::cout << "Usage: sample n " << std::endl;
	return -1;
    }
    int n = atoi(argv[1]);
    thrust::host_vector<int> hv(n,1);

 
    {
        auto t1 = std::chrono::high_resolution_clock::now();
	thrust::device_vector<int> dv = hv;
	int result = 0;

	// initial value of the reduction
	int init = 0; 
 
	// binary operation used to reduce values
	thrust::plus<int> binary_op;

	// compute sum on the device
	result = thrust::reduce(dv.begin(), dv.end(), init, binary_op);
	
        //result = std::accumulate(v.begin(), v.end(), 0.0);
        auto t2 = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double, std::milli> ms = t2 - t1;
        std::cout << std::fixed << "thrust::reduce " << result
                  << " took " << ms.count() << " ms\n";
    }
 
}
