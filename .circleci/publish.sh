#!/bin/sh
set -x
git config --global user.email "build-bot@twingate.com"
git config --global user.name "twingate-build-bot"
git add packages
git add index.yaml
git commit -m "publish ${CIRCLE_BUILD_NUM}"
git checkout gh-pages
git merge master --strategy-option theirs -v --no-edit
git commit -m "merge commit ${CIRCLE_BUILD_NUM}"
git push origin gh-pages
