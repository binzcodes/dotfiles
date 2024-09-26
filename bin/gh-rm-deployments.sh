#!/bin/bash

# Deactivate and delete GitHub deployments for a given repository and environment.

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install it to proceed."
    exit
fi

# Check if gh is installed
if ! command -v gh &> /dev/null
then
    echo "gh could not be found. Please install it to proceed."
    exit
fi

# Check if gh has the necessary permissions
if ! gh --version &> /dev/null
then
    echo "gh does not have the necessary permissions. Please adjust its permissions to proceed."
    exit
fi

# Check if arguments are provided and prompt if not
if [ -z "$1" ]; then
    read -p "Enter repository (format: org/repo): " repo
else
    repo=$1
fi

if [ -z "$2" ]; then
    read -p "Enter environment: " env
else
    env=$2
fi

gh api "repos/${repo}/deployments?environment=${env}" \
  | jq -r ".[].id" \
  | xargs -n 1 -I % sh -c "
  gh api -X POST -F state=inactive repos/${repo}/deployments/%/statuses
  gh api -X DELETE repos/${repo}/deployments/%
  "
