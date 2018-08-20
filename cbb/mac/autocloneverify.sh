# copy to the root of your project folder together with clone-git.sh

sh clone-git.sh

pushd smgit

pushd client/docs/scm
sh setup-svn.sh
popd

sh client/docs/scm/testbuild/testbuild.sh

#pushd client/docs/scm
#sh pull-svn.sh
#popd

#sh client/docs/scm/testbuild/testbuild.sh

popd