#!/bin/sh

# Clone the repository
GIT_BRANCH=${GIT_BRANCH:-'master'}
GIT_REPO=${GIT_REPO:-'git@github.com:bitphy/argo-cron.git'}
NAMESPACE=${NAMESPACE:-'default'}
OLDER=${OLDER:-'5d'}

git clone $GIT_REPO --branch $GIT_BRANCH .

# Execute argo
argo -n $NAMESPACE --serviceaccount $SERVICEACCOUNT submit --wait $PARAMS  $@
# argo -n $NAMESPACE delete --completed

