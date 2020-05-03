@echo off

echo Please choose your preferred Visual Studio version.
choice /c 97 /n /t 3 /d 7 /m "Press '9' for VS 2019 or '7' for VS 2017: "
if errorlevel 1 set vs_version=Visual Studio 16 2019
if errorlevel 2 set vs_version=Visual Studio 15 2017 Win64

REM Create build folder
mkdir build-windows
pushd build-windows

REM Generate project files
IF "%CI%"=="" (
	call cmake -G "%vs_version%" -DCMAKE_TOOLCHAIN_FILE=[vcpkg root]\scripts\buildsystems\vcpkg.cmake ..
) ELSE (
	call cmake -G "%vs_version%" -DCI:BOOL=ON -DCMAKE_CONFIGURATION_TYPES=%CONFIGURATION% -DCMAKE_TOOLCHAIN_FILE=[vcpkg root]\scripts\buildsystems\vcpkg.cmake ..
)
popd
