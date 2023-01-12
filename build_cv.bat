@echo off

rem Set the environment variables for CUDA and OpenCV
set OPENCV_DIR=C:\opencv\build
set CUDA_DIR=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2

rem Set the environment variables for Visual Studio
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

rem Clone the OpenCV and opencv_contrib repositories
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

rem Create a build directory for OpenCV
mkdir %OPENCV_DIR%

rem Run CMake to configure the OpenCV build with CUDA support
cd %OPENCV_DIR%
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=C:\opencv\install -D OPENCV_EXTRA_MODULES_PATH=..\opencv_contrib\modules -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_CUDA=ON -D CUDA_TOOLKIT_ROOT_DIR=%CUDA_DIR% -D CUDA_ARCH_BIN="6.1" -D CUDA_ARCH_PTX="" -D BUILD_opencv_cudacodec=OFF ..\opencv

rem Build OpenCV
msbuild /m /p:Configuration=Release OpenCV.sln

rem Install OpenCV
msbuild /m /p:Configuration=Release INSTALL.vcxproj
