# Building OpenCV from source with CUDA with Python and Anaconda
## Hardware requirements
- A GPU that is compatible with the version of CUDA you wish to use (Linux and Windows)
- NVIDIA Drivers installed (Linux and Windows)
- NVIDIA CUDA Toolkit (Linux and Windows)
- cuDNN Library (Linux and Windows)

## Software requirements
- CMake
- Visual Studio (Community Edition is fine)
- git
- Anaconda

## Requirements for building OpenCV with CUDA on Windows and Linux

- [CMake](https://cmake.org/download/)
- [Git](https://git-scm.com/downloads)
- [Visual Studio](https://visualstudio.microsoft.com/downloads/)
- [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-downloads)
- cuDNN
- [NVIDIA GPU Drivers](https://www.nvidia.com/Download/index.aspx)

# Windows

Clone the OpenCV and opencv_contrib repositories using git

Please make sure that the version of python, cuda, opencv, and the conda environment are compatible and should match. Also check if cuDNN is installed and the path is correct before running the script.

## Usage
1. Clone this repository
2. Modify the script to match your system setup (paths, cuda version, cuda architecture etc)
3. Run the script
4. Wait for the script to finish
5. OpenCV will be built and installed in the location specified by you.

You can use this script as a starting point to build OpenCV on your own machine, and feel free to customize it to suit your specific needs.
Please keep in mind that this script is an example and may require some adjustments to work with your specific system setup.

Please remember to adjust the path where you have installed the different software, the architecture options for CUDA and install directory as per your setup.
You may need to adjust the following parts of the script to match your system setup:

- The location of the NVIDIA GPU Computing Toolkit (CUDA) on your system. The example script assumes it is installed in "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2", but you will need to change this to the location where you have installed CUDA on your system.

- The location of Visual Studio on your system. The example script calls the VC environment script "vcvarsall.bat" that is typically located in "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build" if you have Visual Studio 2017 installed, if you are using different version then path might be different.

- The location of the OpenCV build and install directories. The example script uses "C:\opencv\build" as the build directory and "C:\opencv\install" as the install directory, but you may want to change this to a different location on your system.

- The architecture options (CUDA_ARCH_BIN) should match with your GPU device you are using. In this case, the example script is using architecture 6.1 which is compatible with some of the latest NVIDIA GPUs including Quadro P2000. If you're not sure which architecture to use, you can check the NVIDIA CUDA documentation or consult the GPU Compatibility Guide.

- Cmake options : Depending on your use case you may want to turn on or off additional options.

It's also a good idea to double check the compatibility of OpenCV version, CUDA version and GPU device.

This repository provides a batch file that enables one-click building of OpenCV from source with CUDA support on Windows. With this script, you can easily build OpenCV with CUDA support using Visual Studio and CMake, and also allows you to use different versions of CUDA with different GPUs.





# Linux

## Usage
1. Clone the OpenCV and opencv_contrib repositories using git

You can then run the script by executing `./build_cv_linux.sh`. This will clone OpenCV and opencv_contrib repositories, create a build directory and use cmake to configure OpenCV with CUDA support, then it will build and install OpenCV.

You need to make sure that your conda environment has all the necessary dependencies installed, and is activated before running the script.

Please make sure that the version of python, cuda, opencv, and the conda environment are compatible and should match. Also check if cuDNN is installed and the path is correct before running the script.

# Build OpenCV with GPU acceleration on macOS using Rosetta 2

To build a GPU-accelerated version of OpenCV for Python with a conda environment on macOS, you will need the following:

A Mac that is compatible with Rosetta 2, which allows macOS to run x86_64 executables.
A working installation of conda, which is used to create and manage the conda environment.
CUDA Toolkit and cuDNN library installed.
OpenCL SDK and headers installed, which allows macOS to access the OpenCL API.
A C++ compiler, such as Clang, installed on your system.
The OpenCV and opencv_contrib source code, which can be obtained by cloning the corresponding git repositories.
CMake, which is used to configure and build OpenCV.
It's important to note that you have to have OpenCL support on your Mac from your GPU vendor, if it's not present then you can't use OpenCL with OpenCV on Mac.

You will also need to have the appropriate version of Python installed in your conda environment, as well as any other dependencies that are required by OpenCV. These dependencies are usually specified in the OpenCV documentation.

Once you have met these requirements, you can use CMake to configure and build OpenCV with OpenCL support, and then use the resulting library to accelerate computations in Python.

## Hardware Requirements
- A GPU that is compatible with OpenCL

## Software Requirements
- CMake
- Xcode or a similar IDE
- Rosetta 2 (available on macOS 11 and later)

## Requirements for building OpenCV with GPU acceleration on macOS using Rosetta 2

- [CMake](https://cmake.org/download/)
- [Git](https://git-scm.com/downloads)
- [Xcode](https://developer.apple.com/xcode/)


## Usage
1. Clone the OpenCV and opencv_contrib repositories using git


Please make sure to adjust the path where you have installed the different software and install directory as per your setup.
You can also use OpenCL to run your code on multiple platform including MacOS, Linux, Windows etc.

Keep in mind that building OpenCV with GPU acceleration on macOS using Rosetta 2 requires macOS 11 and later and that this is an experimental feature, and there might be some issues. Always refer the official OpenCV documentation for the most up-to-date information on building OpenCV on macOS.
It's also a good idea to double check the compatibility of OpenCV version, OpenCL version and GPU device before building.


You can then run the script by executing `./build_cv_mac.sh`. This will clone OpenCV and opencv_contrib repositories, create a build directory and use cmake to configure OpenCV and then it will build and install OpenCV.


If all the requirements are met, this script should be able to configure, build, and install OpenCV with OpenCL support in a conda environment on macOS.
It's important to make sure that the paths specified in the script for the OpenCV and opencv_contrib repositories, the OpenCL SDK, and the conda environment are all correct, and that you have a working installation of CMake and a C++ compiler.
Also, it's important to make sure that your Mac supports OpenCL from your GPU vendor and you have the necessary OpenCL SDK installed.
It's possible that you may encounter errors or issues during the build process, and will have to troubleshoot and fix them.

It's recommended to run the script in a new terminal so that environment variables are set correctly.
If you face any issues, you can check the error messages and also look at the CMakeCache.txt file in the build directory to see what options are being passed to CMake.





