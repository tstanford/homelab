#!/bin/bash
ansible-playbook -i servers.ini --private-key ~/.ssh/id_ed25519 optimise-servers.yml
ansible-playbook -i servers.ini --private-key ~/.ssh/id_ed25519 k3s-cluster.yml

KUBECONFIG=./kubeconfig/k3s-master/etc/rancher/k3s/k3s.yaml kubectl get nodes
KUBECONFIG=./kubeconfig/k3s-master/etc/rancher/k3s/k3s.yaml kubectl apply -f ./example_deployment/sparkysite.yaml 

KUBECONFIG=./kubeconfig/k3s-master/etc/rancher/k3s/k3s.yaml kubectl rollout status deployment/sparky-site -n sparky
KUBECONFIG=./kubeconfig/k3s-master/etc/rancher/k3s/k3s.yaml kubectl get all -n sparky
xdg-open http://192.168.0.60
