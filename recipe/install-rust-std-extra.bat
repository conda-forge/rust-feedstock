@echo off
setlocal

cd rust-std

echo %PKG_NAME% > ./components

bash -lce "install.sh --prefix="%PREFIX%" --destdir="%DESTDIR%""

del "%PREFIX%/lib/rustlib/components"
del "%PREFIX%/lib/rustlib/install.log"
del "%PREFIX%/lib/rustlib/rust-installer-version"
del "%PREFIX%/lib/rustlib/uninstall.sh"

endlocal
