#!/bin/sh
# Setup Kubectl and Helm for remote access
gcloud container clusters get-credentials ${cluster} --zone ${zone} --project ${project}
kubectl create clusterrolebinding user-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value account)
kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding tiller-admin-binding --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=default:default concourse-admin
helm init --service-account=tiller --upgrade

# Install Nginx controller
# Wait until helm tiller is initialized
until helm install --name nginx-ingress stable/nginx-ingress --set rbac.create=true --set controller.service.loadBalancerIP="${ip}" --namespace=support; do
  sleep 10
done

