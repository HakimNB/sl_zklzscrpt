call config.bat
pushd %ZKDIR%
set commit_msg=%1
git add .
git reset HEAD *.exe
git reset HEAD *.rdb
git status
git commit -m %commit_msg%
git log -1
popd