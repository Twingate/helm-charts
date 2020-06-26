#!/bin/sh

git config --global user.email "build-bot@twingate.com"
git config --global user.name "twingate-build-bot"
git add packages
git add index.yaml
git commit -m "publish ${CIRCLE_BUILD_NUM}"
git push origin HEAD:gh-pages 

