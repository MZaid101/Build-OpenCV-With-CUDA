#!/bin/bash

# activate the conda environment
# !!! change "base" to the name of your conda environment, or leave it as "base" if building in the base environment
source activate base

# set the path to the OpenCV source directory
opencv_src_dir=/path/to/opencv-source-directory

# set the path to the build directory
build_dir=/path/to/build-directory

# set the path to the CUDA toolkit directory
# !!! change "10.2" to the version of CUDA you have installed
cuda_dir=/usr/local/cuda-10.2

# set the path to the Python executable
# !!! change "3.7" to the version of Python you have installed in the conda environment
python_exe=$CONDA_PREFIX/bin/python

# set the path to the numpy library
numpy_lib=$CONDA_PREFIX/lib/python3.7/site-packages/numpy/core/include

# check if cuDNN library is installed
# !!! change "7" to the version of cuDNN you have installed
if [ ! -f "$cuda_dir/lib64/libcudnn.so.7" ]; then
  echo "cuDNN library not found. Please install cuDNN and add it to the system PATH."
  exit 1
fi

# create the build directory if it doesn't exist
if [ ! -d "$build_dir" ]; then
  mkdir -p $build_dir
fi

# navigate to the build directory
cd $build_dir

# run CMake to configure the build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=install \
      -D WITH_CUDA=ON \
      -D CUDA_TOOLKIT_ROOT_DIR=$
      -D CUDA_TOOLKIT_ROOT_DIR=$cuda_dir \
      -D WITH_CUBLAS=ON \
      -D WITH_NVCUVID=ON \
      -D WITH_CUDNN=ON \
      -D WITH_OPENGL=ON \
      -D BUILD_opencv_python3=ON \
      -D PYTHON_EXECUTABLE=$python_exe \
      -D PYTHON_INCLUDE_DIR=$numpy_lib \
      -D PYTHON_PACKAGES_PATH=$CONDA_PREFIX/lib/python3.7/site-packages \
      $opencv_src_dir

# build OpenCV
make -j $(nproc)

# install OpenCV
make install

# deactivate the conda environment
source deactivate
