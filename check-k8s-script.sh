#!/bin/bash

while true; do
if [ -d /srv/kubernetes/kube-apiserver ]; then
  K8S_DIR="/srv/kubernetes/kube-apiserver"
else
  K8S_DIR="/etc/kubernetes/pki"
fi
#K8S_DIR="/etc/kubernetes/pki"
cd $K8S_DIR
#truncate -s 0 $K8S_DIR/test.txt
> /var/cert/index.html
for cert_name in $(ls -lrth *.crt | cut -d" " -f9 | while read line; do echo $line; done | sort)
do
#        echo $cert_name
echo $cert_name":" >> /var/cert/index.html
echo -e "\t $(openssl x509 -text -noout -in $cert_name | grep Not | while read line ; do echo $line;done | head -1)" >> /var/cert/index.html
echo -e "\t $(openssl x509 -text -noout -in $cert_name | grep Not | while read line ; do echo $line;done | tail -1)" >> /var/cert/index.html
done
sleep 300
done