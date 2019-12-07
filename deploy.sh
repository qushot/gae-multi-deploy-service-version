#!/bin/bash

# Please edits your variables.
PROJECT_ID=YOUR_PROJECT_ID
MAX_SERVICE_NUM=2
MAX_VERSION_NUM=1

# Don't edit.
echo Start
for SERVICE in $(seq 0 ${MAX_SERVICE_NUM}); do
  cp app/template.yaml app/service_${SERVICE}.yaml
  if [ ${SERVICE} -gt 0 ] ; then
    echo "service: service${SERVICE}" >> app/service_${SERVICE}.yaml
  fi
  for VERSION in $(seq 0 ${MAX_VERSION_NUM}); do
    gcloud app deploy app/service_${SERVICE}.yaml --quiet --project=${PROJECT_ID} --version=version-${VERSION};
  done
  rm app/service_${SERVICE}.yaml
done
echo Done
