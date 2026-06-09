#!/bin/bash

set -e

ENV=$1
TFVARS_FILE=$2
CLUSTER=$2

ACTION=${3:-plan}
CLUSTER=$(basename "$TFVARS_FILE" .tfvars)
cd "environment/${ENV}"


terraform init \
  -backend-config="bucket=payal-devops-poc-tfstate-bucket" \
  -backend-config="key=${CLUSTER}/${CLUSTER}.tfstate" \
  -backend-config="region=ap-south-1" \
  -backend-config="encrypt=true" \
  -backend-config="use_lockfile=true" \
  -reconfigure
terraform ${ACTION} \
  -var-file="tfvars/${CLUSTER}.tfvars"