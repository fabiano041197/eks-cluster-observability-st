#!/bin/bash

# Bootstrap script para configurar o ambiente com as ferramentas necessárias

# Atualizaçao de pacotes e instalaço de dependencias
sudo apt-get update
sudo apt-get install -y awscli jq

# Instala o Terraform
TERRAFORM_VERSION="1.5.0"
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -d /usr/local/bin/
rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Instala kubectl
KUBECTL_VERSION="v1.24.0"
curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Instala eksctl
curl --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Verifica as instalaçoes   
terraform version
kubectl version --client
eksctl version

echo "Bootstrap concluído com sucesso!"