# !/bin/bash

# activate the conda environment
# !!! change "base" to the name of your conda environment, or leave it as "base" if building in the base environment
source activate base

# Clone the OpenCV and opencv_contrib repositories using git
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

# Create a build directory for OpenCV
mkdir opencv/build

# set the path to the OpenCV build directory
opencv_build_dir=/path/to/opencv/build

# set the path to the CUDA toolkit directory
# !!! change "10.2" to the version of CUDA you have installed
cuda_dir=/usr/local/cuda-10.2

# set the path to the opencv_contrib modules directory
opencv_contrib_dir=/path/to/opencv_contrib/modules

# navigate to the OpenCV build directory
cd $opencv_build_dir

# run CMake to configure the build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=install \
      -D WITH_CUDA=ON \
      -D CUDA_TOOLKIT_ROOT_DIR=$cuda_dir \
      -D OPENCV_EXTRA_MODULES_PATH=$opencv_contrib_dir \
      -D WITH_CUDNN=ON \
      -D ENABLE_FAST_MATH=1 \
      -D CUDA_FAST_MATH=1 \
      -D BUILD_opencv_cudacodec=OFF \
      -D BUILD_opencv_python2=OFF \
      -D BUILD_opencv_python3=ON \
      -D PYTHON_EXECUTABLE=$CONDA_PREFIX/bin/python \
      -D PYTHON_INCLUDE_DIR=$CONDA_PREFIX/include/python3.7m \
      -D PYTHON_PACKAGES_PATH=$CONDA_PREFIX/lib/python3.7/site-packages \
      /path/to/opencv

# build OpenCV
make -j $(nproc)

# install OpenCV
make install

# deactivate the conda environment
source deactivate
