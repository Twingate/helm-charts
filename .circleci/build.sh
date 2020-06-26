#!/bin/sh

FOLDER="packages"

# peraration 
mkdir -p ${FOLDER}
# build each chart separately
for i in $(ls -1 ${1})
do
    echo "building ${i} chart"
    helm package -d ${FOLDER} ${1}/${i} 
done

helm repo index .