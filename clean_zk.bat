pushd C:\zk\tools\publish_git
CALL clean_android_studio_build.bat
CALL copy_ALL_resource_to_work_dir.bat
popd
pushd C:\zk\tools\MasterDataConverter
CALL ConvertAmcMasterData.bat
CALL ConvertAmcZooCutsceneData.bat
CALL ConvertAmcZooDialogsData.bat
CALL ConvertAmcZooNPCData.bat
CALL ConvertAmcZooQuestsData.bat
CALL ConvertAmcZooWayPointData.bat
popd
pushd C:\zk\client\Match3Machine\proj.win32
rd /s /q "Debug"
rd /s /q "ipch"
rd /s /q "win32_external"
rm -rf *.opensdf
rm -rf *.sdf
popd
pushd C:\zk\tools\publish_git
CALL copy_ALL_resource_to_work_dir.bat
popd