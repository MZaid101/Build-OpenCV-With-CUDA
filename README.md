# Building OpenCV from source with CUDA on Windows

## Hardware requirements
- A GPU that is compatible with the version of CUDA you wish to use
- NVIDIA Drivers installed
- NVIDIA CUDA Toolkit 

## Software requirements
- CMake
- Visual Studio (Community Edition is fine)
- git
- Anaconda

## Requirements for building OpenCV with CUDA on Windows

- [CMake](https://cmake.org/download/)
- [Git](https://git-scm.com/downloads)
- [Visual Studio](https://visualstudio.microsoft.com/downloads/)
- [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-downloads)
- cuDNN
- [NVIDIA GPU Drivers](https://www.nvidia.com/Download/index.aspx)


## Environment setup
1. Clone the OpenCV and opencv_contrib repositories using git
```
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
```
2.  Create a build directory for OpenCV
```
mkdir %OPENCV_DIR%
```
## Build OpenCV

3. Run CMake to configure the OpenCV build with CUDA support
```
cd %OPENCV_DIR%
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=C:\opencv\install -D OPENCV_EXTRA_MODULES_PATH=..\opencv_contrib\modules -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_CUDA=ON -D CUDA_TOOLKIT_ROOT_DIR=%CUDA_DIR% -D CUDA_ARCH_BIN="6.1" -D CUDA_ARCH_PTX="" -D BUILD_opencv_cudacodec=OFF ..\opencv
```
4. Build OpenCV
```
msbuild /m /p:Configuration=Release OpenCV.sln
```
5. Install OpenCV
```
msbuild /m /p:Configuration=Release INSTALL.vcxproj
```

Please remember to adjust the path where you have installed the different software, the architecture options for CUDA and install directory as per your setup.
You may need to adjust the following parts of the script to match your system setup:

- The location of the NVIDIA GPU Computing Toolkit (CUDA) on your system. The example script assumes it is installed in "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2", but you will need to change this to the location where you have installed CUDA on your system.

- The location of Visual Studio on your system. The example script calls the VC environment script "vcvarsall.bat" that is typically located in "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build" if you have Visual Studio 2017 installed, if you are using different version then path might be different.

- The location of the OpenCV build and install directories. The example script uses "C:\opencv\build" as the build directory and "C:\opencv\install" as the install directory, but you may want to change this to a different location on your system.

- The architecture options (CUDA_ARCH_BIN) should match with your GPU device you are using. In this case, the example script is using architecture 6.1 which is compatible with some of the latest NVIDIA GPUs including Quadro P2000. If you're not sure which architecture to use, you can check the NVIDIA CUDA documentation or consult the GPU Compatibility Guide.

- Cmake options : Depending on your use case you may want to turn on or off additional options.

It's also a good idea to double check the compatibility of OpenCV version, CUDA version and GPU device.

This repository provides a batch file that enables one-click building of OpenCV from source with CUDA support on Windows. With this script, you can easily build OpenCV with CUDA support using Visual Studio and CMake, and also allows you to use different versions of CUDA with different GPUs.


## Usage
1. Clone this repository
2. Modify the script to match your system setup (paths, cuda version, cuda architecture etc)
3. Run the script
4. Wait for the script to finish
5. OpenCV will be built and installed in the location specified by you.

You can use this script as a starting point to build OpenCV on your own machine, and feel free to customize it to suit your specific needs.
Please keep in mind that this script is an example and may require some adjustments to work with your specific system setup.



# Build OpenCV with CUDA on Linux

## Hardware Requirements
- A GPU that is compatible with the version of CUDA you wish to use
- NVIDIA Drivers installed
- NVIDIA CUDA Toolkit

## Software Requirements
- CMake
- GCC or a similar compiler

## Requirements for building OpenCV with CUDA on Linux

- [CMake](https://cmake.org/download/)
- [Git](https://git-scm.com/downloads)
- [GCC](https://gcc.gnu.org/install/index.html)
- [NVIDIA CUDA Toolkit](https://developer.nvidia.com/cuda-downloads)
- [NVIDIA GPU Drivers](https://www.nvidia.com/Download/index.aspx)



## Usage
1. Clone the OpenCV and opencv_contrib repositories using git
```
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
```
2. Create a build directory for OpenCV
```
mkdir build
```
3. Run CMake to configure the OpenCV build with CUDA support
```
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_CUDA=ON -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -D CUDA_ARCH_BIN="6.1" -D CUDA_ARCH_PTX="" -D BUILD_opencv_cudacodec=OFF ../opencv
```
4. Build OpenCV
```
sudo make install
```

Please make sure to adjust the path where you have installed the different software, the architecture options for CUDA and install directory as per your setup.
You might want to add additional flags and options depending on your use case.

You can then run the script by executing `./build_cv_linux.sh`. This will clone OpenCV and opencv_contrib repositories, create a build directory and use cmake to configure OpenCV with CUDA support, then it will build and install OpenCV.



# Build OpenCV with GPU acceleration on macOS using Rosetta 2

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
```
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
```
2. Create a build directory for OpenCV
```
mkdir build
```
3. Run CMake to configure the OpenCV build with OpenCL support and turn on the Rosetta 2 compatibility layer
```
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_OPENCL=ON -D OPENCV_DNN_OPENCL=ON -D CMAKE_CXX_FLAGS="-Xarch_x86_64 -arch x86_64h -Xarch_x86_64h -Xarch_arm64 -arch arm64e" ../opencv
```
4. Build OpenCV
```
make -j $(sysctl -n hw.ncpu)
```
5. Install OpenCV
```
sudo make install
```
Please make sure to adjust the path where you have installed the different software and install directory as per your setup.
You can also use OpenCL to run your code on multiple platform including MacOS, Linux, Windows etc.

Keep in mind that building OpenCV with GPU acceleration on macOS using Rosetta 2 requires macOS 11 and later and that this is an experimental feature, and there might be some issues. Always refer the official OpenCV documentation for the most up-to-date information on building OpenCV on macOS.
It's also a good idea to double check the compatibility of OpenCV version, OpenCL version and GPU device before building.


You can then run the script by executing `./build_cv_mac.sh`. This will clone OpenCV and opencv_contrib repositories, create a build directory and use cmake to configure OpenCV and then it will build and install OpenCV.








