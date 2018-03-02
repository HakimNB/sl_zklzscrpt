pushd D:\Development\project\zookeeper
git fetch glee
git fetch origin
git update-ref refs/heads/master refs/remotes/origin/master
git update-ref refs/heads/develop refs/remotes/origin/develop
REM git update-ref refs/heads/hakim refs/remotes/glee/hakim
git status
popd