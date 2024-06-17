#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <instance-name>"
    exit 1
fi

~/.acme.sh/acme.sh --issue --keylength 4096 \
-d *.$1.apps.cloud.pbs-eam.com \
-d *.home.$1.apps.cloud.pbs-eam.com \
-d *.manage.$1.apps.cloud.pbs-eam.com \
--dns dns_ovh --server letsencrypt