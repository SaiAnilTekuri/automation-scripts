#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name:    aws_resource_monitor.sh
# Description:    This script lists various AWS resources, including EC2 instance IDs, 
#                 S3 buckets, Lambda functions, and IAM users. It uses AWS CLI commands
#                 to fetch and display these resources in the terminal.
#
# Usage:          ./aws_resource_monitor.sh
#
# Prerequisites:  
#                 - AWS CLI must be installed and configured with appropriate permissions.
#                   You can configure the AWS CLI by running:
#                     aws configure
#                   Ensure the necessary IAM roles have permissions to access EC2, S3,
#                   Lambda, and IAM.
#                 - `jq` must be installed to parse the JSON output from the AWS CLI for EC2 instances.
#
# Author:         Sai Anil Tekuri
# Created:        2024-09-30
# Version:        1.0
#
# Notes:          
#                 - The script uses `set -e` to exit if any command fails, `set -x` for
#                   debugging output, and `set -o pipefail` to catch pipeline errors.
#                 - Ensure the script is executed in an environment with valid AWS credentials.
#
# Dependencies:   - AWS CLI (https://aws.amazon.com/cli/)
#                 - jq (https://stedolan.github.io/jq/)
#
# -----------------------------------------------------------------------------

set -x
set -e
set -o pipefail

# List EC2 Instance ID's
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# List S3 Buckets
aws s3 ls

# List Lambda Functions
aws lambda list-functions

# List IAM Users
aws iam list-users