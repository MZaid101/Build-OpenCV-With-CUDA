rem activate the conda environment
rem !!! change "base" to the name of your conda environment, or leave it as "base" if building in the base environment
call activate base

rem set the path to the OpenCV source directory
set opencv_src_dir=C:\path\to\opencv-source-directory

rem set the path to the build directory
set build_dir=C:\path\to\build-directory

rem check if the build directory exists, create it if it doesn't
if not exist %build_dir% mkdir %build_dir%

rem navigate to the source directory
cd /d %opencv_src_dir%

rem Clone the OpenCV and opencv_contrib repositories using git
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git

rem set the path to the CUDA toolkit directory
rem !!! change "v10.2" to the version of CUDA you have installed
set cuda_dir=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2

rem set the path to the opencv_contrib modules directory
set opencv_contrib_dir=C:\path\to\opencv_contrib\modules

rem navigate to the build directory
cd /d %build_dir%

rem run CMake to configure the build
cmake -G "Visual Studio 16 2019" -A x64 -T host=x64^
-D CMAKE_BUILD_TYPE=RELEASE ^
-D CMAKE_INSTALL_PREFIX=install ^
-D WITH_CUDA=ON ^
-D CUDA_TOOLKIT_ROOT_DIR=%cuda_dir% ^
-D OPENCV_EXTRA_MODULES_PATH=%opencv_contrib_dir% ^
-D WITH_CUDNN=ON ^
-D ENABLE_FAST_MATH=1 ^
-D CUDA_FAST_MATH=1 ^
-D BUILD_opencv_cudacodec=OFF ^
-D BUILD_opencv_python2=OFF ^
-D BUILD_opencv_python3=ON ^
-D PYTHON_EXECUTABLE=%CONDA_PREFIX%\python.exe ^
-D PYTHON_LIBRARY=%CONDA_PREFIX%\libs\python37.lib ^
-D PYTHON_INCLUDE_DIR=%CONDA_PREFIX%\include ^
-D PYTHON_PACKAGES_PATH=%CONDA_PREFIX%\Lib\site-packages ^
%opencv_src_dir%

rem build OpenCV
cmake --build %build_dir% --config Release

rem install OpenCV
cmake --build %build_dir% --config Release --target install

rem deactivate the conda environment
call deactivate
