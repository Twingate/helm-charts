#!/bin/sh

set -x


FOLDER="packages"

ls -1 ${FOLDER} 
ls -1 ${FOLDER} | xargs -I {} helm push {} oci://us-docker.pkg.dev/twingate-playground/helm-charts-demo

