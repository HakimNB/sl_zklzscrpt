pushd D:\zkas\tools\publish_git
CALL clean_android_studio_build.bat
CALL copy_ALL_resource_to_work_dir.bat
popd
pushd D:\zkas\client\Match3Machine\proj.win32
rd /s /q "Debug"
rm -rf *.opensdf
rm -rf *.sdf
popd
pushd D:\zkas\tools\publish_git
CALL copy_ALL_resource_to_work_dir.bat
popd