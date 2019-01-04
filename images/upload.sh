#!/bin/sh
for i in hhvltxfer00{1..9}; do scp 15-multus.conf  $i:/etc/cni/net.d/;done
scp 15-multus.conf hhvltxfer010:/etc/cni/net.d/
# scp multus.kubeconfig hhvltxfer010:/etc/cni/net.d/multus.d/


# for i in hhvltxfer00{1..9}; do scp 00-multus.conf  $i:/etc/cni/net.d/;done
# scp 00-multus.conf hhvltxfer010:/etc/cni/net.d/

for i in hhvltxfer00{1..9}; do ssh $i "rm -rif /etc/cni/net.d/00-multus.conf"; done
ssh hhvltxfer010 "rm -rif /etc/cni/net.d/00-multus.conf"

for i in hhvltxfer00{1..9}; do ssh $i "systemctl restart kubelet"; done
ssh hhvltxfer010 "systemctl restart kubelet"
# kubectl delete pod pod --force --grace-period=0
# kubectl apply -f multus-daemonset.yml
kubectl -n ftp delete pod pod