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
git update-ref refs/remotes/gitsvn/master refs/remotes/origin/svn
git update-ref refs/heads/svn refs/remotes/origin/svn
git svn fetch
git rebase origin/svn --committer-date-is-author-date
REM git rebase origin/develop --committer-date-is-author-date
popd
REM D:\lazy_scripts\zk
CALL clean_zk.bat
popd