call ..\config.bat
pushd %ZKDIR%\server\Tools\protoc-2.6.1-win32
call GenProtocolProj.bat
copy ..\..\ProtoBuf\Include\* ..\..\..\client\libProto\Include
copy ..\..\ProtoBuf\Source\* ..\..\..\client\libProto\Source
popd