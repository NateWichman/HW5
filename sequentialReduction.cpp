//
// This code is based on code from:
// https://en.cppreference.com/w/cpp/algorithm/reduce
// This is a sequential reduction
//
#include <iostream>
#include <chrono>
#include <vector>
#include <numeric>
 
int main(int argc,char *argv[])
{
    if (argc!=2) {
	std::cout << "Usage: sample n " << std::endl;
	return -1;
    }
    int n = atoi(argv[1]);
    std::vector<int> v(n, 1);
 
    {
        auto t1 = std::chrono::high_resolution_clock::now();
        int result = std::accumulate(v.begin(), v.end(), 0);
        auto t2 = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double, std::milli> ms = t2 - t1;
        std::cout << std::fixed << "std::accumulate result " << result
                  << " took " << ms.count() << " ms\n";
    }
 
}
