call ..\config.bat
pushd %ZKDIR%\server\Tools\protoc-2.6.1-win32
call GenProtocolProj.bat
popd
pushd %ZKDIR%\client\Tools\protoc-2.6.1-win32
call GenProtocolProj.bat
popd