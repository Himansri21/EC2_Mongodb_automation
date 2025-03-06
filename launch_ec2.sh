#!/bin/bash

# Check for required parameter (number of EC2 instances)
if [ "$#" -eq 0 ]; then
    echo "No number of instances provided. Using default value: 1"
    NUM_INSTANCES=1
else
    NUM_INSTANCES=$2
fi

NUM_INSTANCES=$1

# configuration variables
AMI_ID="ami-04b4f1a9cf54c11d0"
INSTANCE_TYPE="t2.micro"
KEY_NAME="NextCloudKey"
SECURITY_GROUP="sg-0e2626e6d65233d81"

echo "Launching ${NUM_INSTANCES} EC2 instance(s)..."


aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --count "$NUM_INSTANCES" \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-group-ids "$SECURITY_GROUP" \
    --user-data file://setup_mongodb.sh

echo "EC2 instance(s) launched."
