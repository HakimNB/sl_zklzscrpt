call ..\config.bat
pushd %ZKDIR%\server\BatchBuild
call copy_required_files_debug.bat
popd