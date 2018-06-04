REM just to be sure it is D:\lazy_scripts\zk
pushd D:\lazy_scripts\zk
CALL clean_zk.bat
pushd C:\zk
git push glee --force
pushd D:\Development\project\zkm
git fetch glee
git fetch origin
git push glee --all
popd
REM C:\zk
git fetch glee
git fetch origin
git rebase origin/develop --committer-date-is-author-date
popd
REM D:\lazy_scripts\zk
CALL clean_zk.bat
popd