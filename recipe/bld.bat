@echo on
set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
FOR /F "delims=" %%i in ('cygpath.exe -u "%PREFIX%/Library"') DO set "PREFIX=%%i"
FOR /F "delims=" %%i in ('cygpath.exe -u "%SRC_DIR%"') DO set "SRC_DIR=%%i"
copy "%RECIPE_DIR%\build.sh" .
bash -lce "%SRC_DIR%/build.sh"
if errorlevel 1 exit 1

@rem We need to delete the two directory as otherwise conda-build treats them as a sysroot
@rem See https://github.com/conda/conda-build/blob/d3b717760f550abd58832c629d7f72aed46ae5ca/conda_build/post.py#L1376-L1381
rmdir /q /s %LIBRARY_PREFIX%\share\doc\rust\html\src\sysroot
if errorlevel 1 exit 1
rmdir /q /s %LIBRARY_PREFIX%\share\doc\rust\html\sysroot
if errorlevel 1 exit 1
