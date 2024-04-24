#!/bin/false
# shellcheck shell=bash
## main_config.bash: This script is intended to be sourced, it can be run in the event the Cloud Shell VM stops after a period
## of inactivity, and it will restore the necessary installed software and environment variables to its desired
## state

# DO NOT MODIFY THIS FILE - Change $HOME/.config/bash/custom_config.bash instead

# Expand directories to avoid escaping of $ signs in variables
shopt -s direxpand

## Set desired environment variables
gcloud config configurations activate default
PROJECT_ID=$(gcloud config get-value project)
export PROJECT_ID
REGION=$(gcloud config get-value compute/region)
export REGION

# Enable kubectl autocompletion and use kubectl alias
#shellcheck disable=SC1090
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

# Set path for extra binaries and scripts
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# Include prompt
#shellcheck source=/dev/null
source "$HOME/.config/bash/prompt.bash"

# Source extra customizations
#shellcheck source=/dev/null
source "$HOME/.config/bash/custom_config.bash"