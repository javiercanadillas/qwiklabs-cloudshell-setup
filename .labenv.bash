#!/bin/false
# shellcheck shell=bash
## .labvenv.bash: This script is intended to be sourced, it can be run in the event the Cloud Shell VM stops after a period
## of inactivity, and it will restore the necessary installed software and environment variables to its desired
## state

# Expand directories to avoid escaping of $ signs in variables
shopt -s direxpand

## Set desired environment variables
# GCP Project ID configuraiton
PROJECT_ID=YOUR_PROJECT_ID
gcloud config set project $PROJECT_ID --no-user-output-enabled 2> /dev/null
export PROJECT_ID

## Unconmment sections that you want enabled, replacing tags YOUR_* with
## the actual values you desire
#GCP Region configuration
REGION=YOUR_REGION
export REGION
gcloud config set compute/region $REGION --no-user-output-enabled 2> /dev/null
gcloud config set run/region $REGION --no-user-output-enabled 2> /dev/null

# Enable kubectl autocompletion and use kubectl alias
#shellcheck disable=SC1090
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

# Set path for extra binaries and scripts
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"
