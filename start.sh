#!/bin/sh

set -e

function exit_error {
  echo "*** ERROR: ${1}"
  exit 1
}

# Parameters check and set defaults
[ -z $PLUGIN_APP_NAME ] && exit_error "Setting 'application_name' is required."
[ -z $PLUGIN_ARGOCD_AUTH_TOKEN ] && exit_error "Setting 'argocd_auth_token' is required."

# Check if the application exists in the cluster
if argocd app list --grpc-web --auth-token $PLUGIN_ARGOCD_AUTH_TOKEN | grep -q $PLUGIN_APP_NAME
then
  echo "$PLUGIN_APP_NAME application exists in the ArgoCD cluster"
  # Sync the application if it exists
  echo "Dry run for the $PLUGIN_APP_NAME sync:"
  argocd app sync $PLUGIN_APP_NAME --grpc-web --auth-token $PLUGIN_ARGOCD_AUTH_TOKEN --dry-run

  echo "Syncing $PLUGIN_APP_NAME"
  argocd app sync $PLUGIN_APP_NAME --grpc-web --auth-token $PLUGIN_ARGOCD_AUTH_TOKEN
  exit 0
else
  echo "$PLUGIN_APP_NAME application does not exists in the ArgoCD cluster"
  exit 1
fi
