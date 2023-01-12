# Building OpenCV from source with CUDA on Windows

## Hardware requirements
- A GPU that is compatible with the version of CUDA you wish to use
- NVIDIA Drivers installed
- NVIDIA CUDA Toolkit 

## Software requirements
- CMake
- Visual Studio (Community Edition is fine)
- git

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
