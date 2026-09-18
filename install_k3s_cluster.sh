#!/bin/bash
ansible-playbook -i servers.ini --private-key ~/.ssh/id_ed25519 optimise-servers.yml
ansible-playbook -i servers.ini --private-key ~/.ssh/id_ed25519 k3s-cluster.yml

export KUBECONFIG=./kubeconfig/k3s-master/etc/rancher/k3s/k3s.yaml

kubectl get nodes

# kubectl apply -f ./example_deployment/helloapi.yaml 
# kubectl rollout status deployment/helloapi -n hello
# kubectl get all -n hello
# xdg-open http://192.168.0.59/hello

kubectl apply -f ./example_deployment/sparkysite.yaml 
kubectl rollout status deployment/sparky-site -n sparky
kubectl get all -n sparky
xdg-open http://192.168.0.60
