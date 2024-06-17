#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <secret-name> <new-file-path>"
    echo "Generally the <secret-name> is ibm-sls-sls-entitlement"
    exit 1
fi

SECRET_NAME=$1
NEW_FILE_PATH=$2

# Encode the new file content to base64
NEW_FILE_CONTENT=$(base64 -w 0 "$NEW_FILE_PATH")

# Retrieve the current secret
CURRENT_SECRET=$(oc get secret $SECRET_NAME -o json)

# Update the secret with the new base64-encoded file content
UPDATED_SECRET=$(echo "$CURRENT_SECRET" | jq --arg newContent "$NEW_FILE_CONTENT" '.data.entitlement = $newContent')

# Apply the updated secret back to OpenShift
echo "$UPDATED_SECRET" | oc apply -f -

echo "Secret $SECRET_NAME updated successfully."
