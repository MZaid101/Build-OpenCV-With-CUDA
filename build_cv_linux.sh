#!/bin/bash

# Clone the OpenCV and opencv_contrib repositories using git
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

# Create a build directory for OpenCV
mkdir opencv/build

# Run CMake to configure the OpenCV build with CUDA support
cd opencv/build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D ENABLE_PRECOMPILED_HEADERS=OFF -D WITH_CUDA=ON -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -D CUDA_ARCH_BIN="6.1" -D CUDA_ARCH_PTX="" -D BUILD_opencv_cudacodec=OFF ../

# Build OpenCV
make -j $(nproc)

# Install OpenCV
sudo make install
