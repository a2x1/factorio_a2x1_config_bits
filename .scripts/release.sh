#!/bin/bash


NAME=`jq .name info.json -r`
VERSION=`jq .version info.json -r`

echo ${NAME}_${VERSION}.zip
echo ${FACTORIO_USER}

CSRF=$(curl -b cookiejar.txt -c cookiejar.txt -s https://mods.factorio.com/login | grep csrf_token | sed -r -e 's/.*value="(.*)".*/\1/')

# Authenticate with the credential secrets and the CSRF token, getting a session cookie for the authorized user
curl -b cookiejar.txt -c cookiejar.txt -s -F "csrf_token=${CSRF}" -F "username=${FACTORIO_USER}" -F "password=${FACTORIO_PASSWORD}" -o /dev/null https://mods.factorio.com/login

# Query the mod info, verify the version number we're trying to push doesn't already exist
curl -b cookiejar.txt -c cookiejar.txt -s "https://mods.factorio.com/api/mods/${NAME}/full" | jq -e ".releases[]? | select(.version == \"${VERSION}\")"

# store the return code before running anything else
STATUS_CODE=$?
if [[ $STATUS_CODE -ne 4 ]]; then
    echo "Release already exists, skipping"
    exit 78
fi
echo "Release doesn't exist for ${VERSION}, uploading"

# Load the upload form, getting an upload token
UPLOAD_TOKEN=$(curl -b cookiejar.txt -c cookiejar.txt -s "https://mods.factorio.com/mod/${NAME}/downloads/edit" | grep token | sed -r -e "s/.*token: '(.*)'.*/\1/")
if [[ -z "${UPLOAD_TOKEN}" ]]; then
    echo "Couldn't get an upload token, failed"
    exit 1
fi
