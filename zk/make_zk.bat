pushd C:\zk\client\vendors\asyn-script\lib-asyn-script\proj.win32
cmake-converter -p lib-asyn-script.vcxproj
popd
pushd C:\zk\client\externals\engine\client\framework\libCommon\proj.win32
cmake-converter -p libCommon.vcxproj
popd
pushd C:\zk\client\externals\engine\client\vendor\jsoncpp\proj.win32
cmake-converter -p libJsonCpp.vcxproj
popd
pushd C:\zk\client\externals\engine\client\vendor\libKtx\proj.win32
cmake-converter -p libKtx.vcxproj
popd
pushd C:\zk\client\externals\engine\client\framework\libPlatform\proj.win32
cmake-converter -p libPlatform.vcxproj
popd
pushd C:\zk\client\libProto\project\proj.win32
cmake-converter -p libProto.vcxproj
popd
pushd C:\zk\client\externals\engine\client\vendor\protobuf-2.6.1\vsprojects
cmake-converter -p libprotobuf.vcxproj
popd
pushd C:\zk\client\libPuzzle\proj.win32
cmake-converter -p libPuzzle.vcxproj
popd
pushd C:\zk\client\externals\engine\client\vendor\libSpine\proj.win32
cmake-converter -p libSpine.vcxproj
popd
pushd C:\zk\client\externals\engine\client\vendor\libTinyxml2\proj.win32
cmake-converter -p libTinyxml2.vcxproj
popd
pushd C:\zk\client\externals\engine\client\framework\libUi\proj.win32
cmake-converter -p libUi.vcxproj
popd
pushd C:\zk\client\Match3Machine\proj.win32
cmake-converter -p MatchThreeMachine.vcxproj
popd

REM lib-asyn-script
REM libKtx
REM libJsonCpp