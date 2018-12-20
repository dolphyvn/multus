#!/bin/sh
for i in hhvltxfer00{1..9}; do scp 10-multus.conf  $i:/etc/cni/net.d/; done
scp 10-multus.conf hhvltxfer010:/etc/cni/net.d/
#for i in hhvltxfer00{1..9}; do ssh $i "systemctl restart kubelet"; done
#ssh hhvltxfer010 "systemctl restart kubelet"