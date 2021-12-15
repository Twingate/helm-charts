#!/bin/sh

FOLDER="packages"

mkdir -p ${FOLDER}
# build each chart separately
for i in $(ls -1 ${1})
do
    echo "building ${i} chart"
    helm package -d ${FOLDER} ${1}/${i} 
done

curl https://twingate.github.io/helm-charts/index.yaml > index.yaml

helm repo index . --url https://twingate.github.io/helm-charts --merge index.yaml