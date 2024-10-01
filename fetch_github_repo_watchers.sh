#!/bin/bash


# -----------------------------------------------------------------------------
# Script Name:    fetch_github_repo_watchers.sh
# Description:    This script lists all the watchers for a given GitHub repository.
#                 It uses the GitHub API and requires a username and token for authentication.
#
# Usage:          ./fetch_github_repo_watchers.sh <owner> <repo>
#                 Example: .fetch_github_repo_watchers.sh octocat Hello-World
#
# Arguments:      <owner> - GitHub repository owner (user or organization name)
#                 <repo>  - GitHub repository name
#
# Prerequisites:  - The GitHub API requires authentication. You need to export your 
#                   GitHub username and personal access token before running this script:
#                     export username="your_github_username"
#                     export token="your_github_token"
#                 - `jq` must be installed to parse JSON output from the API.
#
# Author:         Sai Anil Tekuri
# Created:        2024-09-30
# Version:        1.0
#
# Dependencies:   - curl (to make API requests)
#                 - jq (to parse JSON)
#
# -----------------------------------------------------------------------------

# GitHub API URL
API_URL="https://api.github.com"


# Username and token for github authentication. These must be exported before executing the script.
USERNAME=$username
TOKEN=$token

# Command Line Args 
OWNER=$1
REPO=$2

# Helper function to handle missing command-line arguments
function check_args {
    if [[ -z "$OWNER" || -z "$REPO" ]]; then
        echo "Error: Missing arguments."
        echo "Usage: $0 <owner> <repo>"
        exit 1
    fi
}

# Function to prepare the api endpoint
function get_github_api {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
    
}

# Function to list watchers for a repository
function list_watchers_for_a_repository {

    local endpoint="repos/${OWNER}/${REPO}/subscribers"

    watchers="$(get_github_api "$endpoint" | jq -r '.[].login')"

    if [[ -z "$watchers" ]]; then
    echo "No watchers found for the repo ${OWNER}/${REPO}."
    else
    echo "Watchers to ${OWNER}/${REPO}:"
    echo "$watchers"

    fi
}

# Check if command-line arguments are provided
check_args

# Execute the function
list_watchers_for_a_repository