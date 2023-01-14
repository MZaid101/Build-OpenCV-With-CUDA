rem activate the conda environment
rem !!! change "myenv" to the name of your conda environment, or leave it as "base" if building in the base environment
call activate myenv

rem set the path to the OpenCV source directory
set opencv_src_dir=C:\path\to\opencv-source-directory

rem set the path to the build directory
set build_dir=C:\path\to\build-directory

rem set the path to the CUDA toolkit directory
rem !!! change "v10.2" to the version of CUDA you have installed
set cuda_dir=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.2

rem set the path to the Python executable
rem !!! change "3.7" to the version of Python you have installed in the conda environment
set python_exe=%CONDA_PREFIX%\python.exe

rem set the path to the Python library
rem !!! change "3.7" to the version of Python you have installed in the conda environment
set python_lib=%CONDA_PREFIX%\libs\python37.lib

rem set the path to the numpy library
set numpy_lib=%CONDA_PREFIX%\Lib\site-packages\numpy\core\include

rem check if cuDNN library is installed
rem !!! change "v7" to the version of cuDNN you have installed
if not exist "%cuda_dir%\lib\x64\cudnn.lib" (
  echo cuDNN library not found. Please install cuDNN and add it to the system PATH.
  exit /b 1
)

rem create the build directory if it doesn't exist
if not exist %build_dir% mkdir %build_dir%

rem navigate to the build directory
cd /d %build_dir%

rem run CMake to configure the build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=install -D WITH_CUDA=ON -D CUDA_TOOLKIT_ROOT_DIR=%cuda_dir% -D WITH_CUBLAS=ON -D WITH_NVCUVID=ON -D WITH_CUDNN=ON -D WITH_OPENGL=ON -D BUILD_opencv_python3=ON -D PYTHON_EXECUTABLE=%python_exe% -D PYTHON_LIBRARY=%python_lib% -D PYTHON_INCLUDE_DIR=%numpy_lib% %opencv_src_dir%

rem build OpenCV
msbuild opencv.sln /p:Configuration=Release

rem install OpenCV
msbuild opencv.sln /p:Configuration=Release /target:INSTALL

rem deactivate the conda environment
call deactivate
