call config.bat
pushd %ZKDIR%\tools\publish_git
REM remove all files inside app_data
del /S /F /Q "app_data"
REM remove the directory itself
rmdir /S /Q "app_data"
CALL clean_android_studio_build.bat
CALL copy_ALL_resource_to_work_dir.bat
popd
pushd %ZKDIR%\tools\MasterDataConverter
CALL ConvertAmcMasterData.bat
CALL ConvertZooConfig_All.bat
popd
pushd %ZKDIR%\client\Match3Machine\proj.win32
rd /s /q "Debug"
rd /s /q "ipch"
rd /s /q "win32_external"
mkdir "win32_external"
rm -rf *.opensdf
rm -rf *.sdf
popd
pushd %ZKDIR%\client\Match3Machine\proj.androidstudio\CandySurver
rd /s /q "build"
popd
pushd %ZKDIR%\client\vendors\IGGSDK_for_Android_1.4.0\proj\IGGCommonLibs
rd /s /q "build"
popd
pushd %ZKDIR%\tools\publish_git
CALL copy_ALL_resource_to_work_dir.bat
popd