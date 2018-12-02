sequentialReduction: sequentialReduction.cpp
	g++ sequentialReduction.cpp -o sequentialReduction -std=c++11

thrustReduction: thrustReduction.cu
	nvcc thrustReduction.cu -o thrustReduction -std=c++11


