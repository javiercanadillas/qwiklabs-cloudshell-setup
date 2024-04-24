#!/bin/false
# shellcheck shell=bash
## main_config.bash: This script is intended to be sourced, it can be run in the event the Cloud Shell VM stops after a period
## of inactivity, and it will restore the necessary installed software and environment variables to its desired
## state

# DO NOT MODIFY THIS FILE - Change $HOME/.config/bash/custom_config.bash instead

# Expand directories to avoid escaping of $ signs in variables
shopt -s direxpand

# Add dirs to PATH properly
pathadd() {
    PATH=:$PATH
    PATH=$1${PATH//:$1:/:}
}

## Set desired environment variables
export CLOUDSDK_CONFIG="$HOME/.config/gcloud"
gcloud config configurations activate default --quiet --no-user-output-enabled
export CLOUDSDK_CONFIG
export PROJECT_ID
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
[[ -d "$HOME/.local/bin" ]] && pathadd "$HOME/.local/bin"

# Other aliases
alias code='cloudshell edit'
alias gconf='gcloud config configurations'

# Pyenv 
export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && pathadd "$PYENV_ROOT/bin"
hash pyenv && eval "$(pyenv init -)"

# Include prompt
#shellcheck source=/dev/null
source "$HOME/.config/bash/prompt.bash"

# Source extra customizations
#shellcheck source=/dev/null
source "$HOME/.config/bash/custom_config.bash"