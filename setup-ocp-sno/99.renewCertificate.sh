./00.generateIngressCertificat.sh
cd ~/.acme.sh/apps.cloud.pbs-eam.com/
oc set data secret/letsencrypt-tls -n openshift-ingress --from-file=tls.crt=apps.cloud.pbs-eam.com.cer && oc set data secret/letsencrypt-tls -n openshift-ingress --from-file=tls.key=apps.cloud.pbs-eam.com.key 