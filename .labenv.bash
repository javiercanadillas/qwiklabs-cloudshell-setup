#!/bin/false
# shellcheck shell=bash
## .labvenv.bash: This script is intended to be sourced, it can be run in the event the Cloud Shell VM stops after a period
## of inactivity, and it will restore the necessary installed software and environment variables to its desired
## state

## Set desired environment variables
# GCP Project ID configuraiton
PROJECT_ID=YOUR_PROJECT_ID
gcloud config set project $PROJECT_ID 2> /dev/null
export PROJECT_ID

## Unconmment sections that you want enabled, replacing tags YOUR_* with
## the actual values you desire
# GCP Region configuration
#REGION=YOUR_REGION
#export REGION
#gcloud config set compute/region $REGION 2> /dev/null
#gcloud config set run/region $REGION 2> /dev/null

# Code working directory configuration
#WORKDIR=YOUR_WORKDIR
#export WORKDIR

# Mark the sourcing of this file
mkdir -p YOUR_CONFIG_DIR
touch "YOUR_CONFIG_DIR/.labenv_sourced"

# Set path for extra binaries and scripts
[[ -d "$HOME/bin" ]] && export PATH="$HOME/bin:$PATH"

# Rehash bash
hash -r