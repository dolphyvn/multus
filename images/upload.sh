#!/bin/sh
for i in hhvltxfer00{1..9}; do scp 15-multus.conf  $i:/etc/cni/net.d/;scp multus.kubeconfig  $i:/etc/cni/net.d/multus.d/;done
scp 15-multus.conf hhvltxfer010:/etc/cni/net.d/
scp multus.kubeconfig hhvltxfer010:/etc/cni/net.d/multus.d/

# for i in hhvltxfer00{1..9}; do ssh $i "mv /etc/cni/net.d/10-calico.conflist /etc/cni/net.d/20-calico.conflist"; done
# ssh hhvltxfer010 "mv /etc/cni/net.d/10-calico.conflist /etc/cni/net.d/20-calico.conflist"

for i in hhvltxfer00{1..9}; do ssh $i "systemctl restart kubelet"; done
ssh hhvltxfer010 "systemctl restart kubelet"
kubectl delete pod pod --force --grace-period=0
kubectl apply -f multus-daemonset.yml
