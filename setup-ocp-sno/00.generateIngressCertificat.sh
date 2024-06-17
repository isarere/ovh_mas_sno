~/.acme.sh/acme.sh --issue --keylength 4096 \
-d apps.cloud.pbs-eam.com \
-d *.apps.cloud.pbs-eam.com \
-d api.cloud.pbs-eam.com \
--dns dns_ovh --server letsencrypt