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
git checkout svn
git svn rebase
git push glee svn:svn
git push origin svn:svn
REM start - do this for all available svn-branches
git checkout test
git svn rebase
git push glee test:test
git push origin test:test
REM end - do this for all available svn-branches
git checkout hakim
git rebase origin/svn --committer-date-is-author-date
REM git rebase origin/develop --committer-date-is-author-date
popd
REM D:\lazy_scripts\zk
CALL clean_zk.bat
popd