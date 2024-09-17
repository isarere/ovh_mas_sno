#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <instance-name> <workspace-name>"
    exit 1
fi

~/.acme.sh/acme.sh --issue --keylength 4096 \
-d *.$2-$1-optimizer.svc \
-d *.$2-$1-optimizer.svc \
-d *.$2-$1-optimizer.svc.cluster.local \
--dns dns_ovh --server letsencrypt

