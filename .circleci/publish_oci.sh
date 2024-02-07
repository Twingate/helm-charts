#!/bin/sh

set -x


FOLDER="packages"

ls -1 ${FOLDER} | xargs -I {} helm push ./${FOLDER}/{} oci://us-docker.pkg.dev/twingate-playground/helm-charts-demo

