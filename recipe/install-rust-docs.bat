set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
FOR /F "delims=" %%i in ('cygpath.exe -u "%PREFIX%"') DO set "PREFIX=%%i/Library"
FOR /F "delims=" %%i in ('cygpath.exe -u "%SRC_DIR%"') DO set "SRC_DIR=%%i"
copy "%RECIPE_DIR%\install-rust-docs.sh" .
bash -lce "%SRC_DIR%/install-rust-docs.sh"
if errorlevel 1 exit 1
