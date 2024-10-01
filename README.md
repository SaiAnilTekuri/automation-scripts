# Automation Scripts

A collection of useful shell scripts to automate various tasks such as interacting with APIs, system maintenance, deployment automation, and more. These scripts are designed to be modular and customizable for a wide range of automation use cases.

## Table of Contents
- [Scripts Overview](#scripts-overview)
  - [List GitHub Watchers](#list-github-watchers)
  - [List AWS Resources](#list-aws-resources)

## Getting Started

These scripts are designed to work on Unix-like systems such as Linux and macOS. They automate tasks related to API interaction, system maintenance, and more. Follow the instructions below to get started.

## Scripts Overview

### List GitHub Watchers

This script fetches the list of watchers (subscribers) for a given GitHub repository using the GitHub API.

- **Script**: `fetch_github_repo_watchers.sh`
- **Usage**: 
  ```bash
  ./fetch_github_repo_watchers.sh <owner> <repository>

- **Dependencies**: curl, jq

- **Environment Variables**:
  - **username**: Your GitHub username.
  - **token**: Your GitHub personal access token.

### List AWS Resources

This script lists various AWS resources such as EC2 instance IDs, S3 buckets, Lambda functions, and IAM users using the AWS CLI.

- **Script**: `aws_resource_monitor.sh`
`
- **Usage**:
  ```bash
  ./aws_resource_monitor.sh

- **Dependencies**:
  - **aws CLI**: (https://aws.amazon.com/cli/)
  - **jq**: (https://stedolan.github.io/jq/)
