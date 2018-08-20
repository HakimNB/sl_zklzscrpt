pushd ./casino-builder/
git fetch gitlab
git update-ref refs/remotes/origin/trunk refs/remotes/gitlab/master
git update-ref refs/remotes/origin/1.7 refs/remotes/gitlab/branches/1.7
git update-ref refs/heads/master refs/remotes/gitlab/master
git update-ref refs/heads/branches/1.7 refs/remotes/gitlab/branches/1.7
git update-ref refs/heads/branches/ios/1_7_0 refs/remotes/gitlab/branches/ios/1_7_0
git svn fetch
popd