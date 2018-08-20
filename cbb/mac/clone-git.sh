mkdir smgit
git clone -b develop http://10.6.0.253/sweetmaker/sweetmaker.git ./smgit --origin gitlab --recursive
pushd smgit
git checkout -b master gitlab/master
git checkout develop
git config core.fileMode false
git config core.autocrlf false
pushd client/externals/engine
git remote rename origin gitlab
git config core.fileMode false
git config core.autocrlf false
popd
pushd client/Match3Machine/proj.ios/ios_resources
git config core.fileMode false
git config core.autocrlf false
popd
popd