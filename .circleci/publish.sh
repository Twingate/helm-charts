#!/bin/sh

FOLDER="packages"
INDEX="index.yaml"

helm3 repo index ${FOLDER} --url ${1}
mv ${FOLDER}/${INDEX} ${INDEX}
git config --global user.email "twingate-bot@twingate.com"
git config --global user.name "twingate-build-bot"
git add packages
git add ${INDEX}
git commit -m "publish ${CIRCLE_BUILD_NUM}"
git push origin HEAD:gh-pages --force

