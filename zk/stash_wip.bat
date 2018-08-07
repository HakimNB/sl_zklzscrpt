call config.bat
pushd %ZKDIR%
git add .
git reset HEAD *.exe
git reset HEAD *.rdb
git status
git commit -m "stash: wip"
git log -1
popd