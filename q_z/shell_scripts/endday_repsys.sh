#!/bin/bash
pushd .
# https://gist.github.com/gitaarik/8735255

cd ~/src/repsys/volumes/ansible/rsapb
echo "commit rsapb"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/bash/rsbsh
echo "commit rsbsh"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/go/replib
echo "commit replib"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/go/runner
echo "commit runner"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/go/tutorials/docker/go_web_docker
echo "commit go_web_docker"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/java/etlj
echo "commit etlj"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/python/tutorials/flask_cert
echo "commit flask_cert"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys/volumes/sql/tbsql
echo "commit tbsql"
git add -A 
git commit -m "updated source code"
git push -u origin main

cd ~/src/repsys
echo "commit repsys"
git add -A 
git commit -m "updated source code"
git push -u origin main

popd