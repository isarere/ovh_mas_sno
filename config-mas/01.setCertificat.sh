#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <instance-name> <private-key-path> <ca-path> <public-key-path>"
    exit 1
fi

INST_NAME=$1
PK_PATH=$2
CA_PATH=$3
PUB_PATH=$4

oc project mas-$INST_NAME-core
# Activate manual certificate
oc patch suite/$INST_NAME -n mas-$INST_NAME-core --type='json' -p='[{"op": "replace", "path": "/spec/settings/manualCertMgmt", "value":True}]'

# update certificates
oc set data secret/$INST_NAME-cert-public -n mas-$INST_NAME-core --from-file=tls.key=$PK_PATH
oc set data secret/$INST_NAME-cert-public -n mas-$INST_NAME-core --from-file=ca.crt=$CA_PATH
oc set data secret/$INST_NAME-cert-public -n mas-$INST_NAME-core --from-file=tls.crt=$PUB_PATH