#!/bin/bash

docker pull gcr.io/auto-ml-project-2aa7/cloud-build-flask-dem

# 80 is port of VM
# 5000 is port of server

docker run -dp 80:5000 aed

docker run --rm gcr.io/google-containers/busybox echo "hello world"


docker run -dp 80:5000 gcr.io/auto-ml-project-2aa7/automl-labeling-tool

docker run 

gcloud compute instances create-with-container flask-vm \
    --container-image gcr.io/auto-ml-project-2aa7/cloud-build-flask-demo \
    --zone=us-east1-b \
    --network=automl-vpc \
    --subnet=automl-subnet \
    --tags=auto-ml \
    --no-address
