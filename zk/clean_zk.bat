pushd C:\zk\tools\publish_git
CALL clean_android_studio_build.bat
CALL copy_ALL_resource_to_work_dir.bat
popd
pushd C:\zk\tools\MasterDataConverter
CALL ConvertAmcMasterData.bat
CALL ConvertZooConfig_All.bat
popd
pushd C:\zk\client\Match3Machine\proj.win32
rd /s /q "Debug"
rd /s /q "ipch"
rd /s /q "win32_external"
rm -rf *.opensdf
rm -rf *.sdf
popd
pushd C:\zk\client\Match3Machine\proj.androidstudio\CandySurver
rd /s /q "build"
popd
pushd C:\zk\client\vendors\IGGSDK_for_Android_1.4.0\proj\IGGCommonLibs
rd /s /q "build"
popd
pushd C:\zk\tools\publish_git
CALL copy_ALL_resource_to_work_dir.bat
popd