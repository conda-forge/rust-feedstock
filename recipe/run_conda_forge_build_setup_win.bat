@echo off
:: A local hook replaces conda-smithy's standard setup call, so run it first.
call run_conda_forge_build_setup
if errorlevel 1 exit /b %ERRORLEVEL%

:: Rust archive indexing fails in the runner's default temporary directory,
:: but succeeds with temporary files on the checkout filesystem.
:: Do not use SETLOCAL: TEMP and TMP must reach the parent build process.
for %%I in ("%~dp0..") do set "TEMP=%%~fI\.rattler-build-tmp"
set "TMP=%TEMP%"
if not exist "%TEMP%\" mkdir "%TEMP%"
if errorlevel 1 exit /b %ERRORLEVEL%
echo Using Rust build temporary directory: %TEMP%
exit /b 0
