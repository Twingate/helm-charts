#!/bin/sh

FOLDER="packages"

# peraration 
mkdir -p ${FOLDER}

git config --global user.email "build-bot@twingate.com"
git config --global user.name "twingate-build-bot"
git checkout gh-pages
git rebase master
# build each chart separately
for i in $(ls -1 ${1})
do
    echo "building ${i} chart"
    helm3 package -d ${FOLDER} ${1}/${i} 
done