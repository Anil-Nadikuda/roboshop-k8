# Roboshop-k8 🚀

This repository contains everything needed to deploy the **Roboshop microservices application** on Kubernetes with production-ready configurations.  

## 📂 What’s Included
- **Helm Charts** → For all Roboshop components (frontend, catalogue, user, cart, shipping, payment, MongoDB, Redis, RabbitMQ, MySQL, etc.)  
- **Ingress Controller & Load Balancer** → For external access and routing  
- **Horizontal Pod Autoscaler (HPA)** → To scale services dynamically based on load  
- **Terraform Script** → To create a workspace instance with default software pre-installed  
- **Shell Script** → For automation and bootstrap setup  
- **Kubernetes YAMLs** → StorageClass, Namespace, and supporting configs  

## 🚀 Deployment
1. Provision infra with Terraform:
   ```bash
   terraform init
   terraform apply
2. Creation of EKS cluster with Eksctl:
    eksctl create cluster -f eks.yaml
3. creation of Namespace and StorageClass:
     kubectl apply -f namespace.yaml
     kubectl apply -f sc.yaml [yaml file names]
