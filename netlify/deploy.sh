#!/bin/bash -x


env

if [ "${INCOMING_HOOK_BODY}" == "" ] ; then
  exit 0
fi

DOWNLOAD_URL=$(echo "${INCOMING_HOOK_BODY}" | jq -r .download_url | base64 -d)
ARTIFACT_ID=$(echo "${INCOMING_HOOK_BODY}" | jq -r .artifact_id)

wget "${DOWNLOAD_URL}" -O - | tar xzvf -
mv "${ARTIFACT_ID}" public
