set MSYSTEM=MINGW%ARCH%
set MSYS2_PATH_TYPE=inherit
set CHERE_INVOKING=1
FOR /F "delims=" %%i in ('cygpath.exe -u "%PREFIX%/Library"') DO set "pfx=%%i"
copy "%RECIPE_DIR%\install-rust-std.sh" .
bash -lce "./install-rust-std.sh"
if errorlevel 1 exit 1
