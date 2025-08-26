# Cluster EKS na AWS com Terraform e Observabilidade

Este projeto utiliza Terraform para provisionar um cluster Amazon EKS (Elastic Kubernetes Service) na AWS de forma modular e automatizada. A configuração inclui todos os componentes necessários de rede, papéis IAM, grupos de nós e um conjunto de addons essenciais para gerenciamento, escalabilidade e observabilidade do cluster.

## Estrutura do Projeto

```
eks-cluster-observability-st/
├── environments/
│   ├── qa/                # Configuração para o ambiente de Qualidade (QA)
│   └── prod/              # Configuração para o ambiente de Produção
├── modules/
│   ├── addons/            # Módulo para instalar addons (Prometheus, Metrics Server, etc.)
│   ├── datadog/           # Módulo para configurar a integração com o Datadog
│   ├── eks/               # Módulo para criar o control plane do EKS
│   ├── iam/               # Módulo para papéis e políticas IAM
│   ├── node_groups/       # Módulo para gerenciar os grupos de nós (workers)
│   └── vpc/               # Módulo para criar a VPC e componentes de rede
├── scripts/
│   └── bootstrap.sh       # Script para instalar as ferramentas CLI necessárias
├── .gitignore
├── README.md              # Esta documentação
└── versions.tf
```

## Recursos Provisionados

*   **Rede (VPC):** Uma VPC completa com sub-redes públicas e privadas, NAT Gateways e Internet Gateway.
*   **IAM:** Papéis dedicados para o Cluster EKS, Node Groups e integrações.
*   **EKS:** Um cluster Kubernetes gerenciado com grupos de nós auto-escaláveis.
*   **Addons de Observabilidade:**
    *   **Kube-Prometheus-Stack:** Suíte de monitoramento com Prometheus, Grafana e Alertmanager.
    *   **Metrics Server:** Essencial para o Horizontal Pod Autoscaler (HPA).
*   **Integração com Datadog:** Configuração da integração a nível de conta AWS.

## Pré-requisitos

Antes de começar, certifique-se de que você tem as seguintes ferramentas instaladas e configuradas:

*   **Terraform:** Versão `~> 1.5.0` ou superior.
*   **AWS CLI:** Autenticado na sua conta AWS com as permissões necessárias.
*   **kubectl:** Ferramenta de linha de comando para interagir com clusters Kubernetes.

O script `scripts/bootstrap.sh` pode ser usado para instalar as ferramentas CLI em um ambiente baseado em Debian/Ubuntu.

## Gerenciamento de Estado (Backend S3)

Para garantir a segurança e a colaboração, o estado do Terraform deve ser armazenado remotamente. Este projeto está configurado para usar um bucket S3 e uma tabela DynamoDB.

**Ação Necessária:**
1.  **Crie um bucket S3** em uma conta AWS para armazenar os arquivos `.tfstate`.
2.  **Crie uma tabela DynamoDB** com uma chave primária chamada `LockID` (do tipo String) para o bloqueio de estado.
3.  Atualize o arquivo `environments/<seu-ambiente>/backend.tf` com os nomes dos recursos que você criou.

## Como Executar

### 1. Clone o Repositório
```bash
git clone <url-do-repositorio>
cd eks-cluster-observability-st
```

### 2. Configure o Ambiente

1.  Navegue até o diretório do ambiente desejado (ex: `qa`):
    ```bash
    cd environments/qa
    ```

2.  Crie um arquivo `terraform.tfvars` para armazenar as variáveis do seu ambiente. **Nunca comite este arquivo no Git.**

    **Exemplo de `terraform.tfvars`:**
    ```hcl
    cluster_name = "meu-cluster-qa"
    aws_region   = "us-east-1"

    # Configuração da VPC
    vpc_cidr           = "10.10.0.0/16"
    public_subnets     = ["10.10.1.0/24", "10.10.2.0/24"]
    private_subnets    = ["10.10.101.0/24", "10.10.102.0/24"]
    availability_zones = ["us-east-1a", "us-east-1b"]

    # Configuração dos Node Groups
    instance_type    = "t3.medium"
    desired_capacity = 2
    min_size         = 1
    max_size         = 4

    # Variáveis Sensíveis
    grafana_admin_password = "UmaSenhaMuitoForteParaOGrafana"
    datadog_api_key        = "SUA_DATADOG_API_KEY"
    datadog_app_key        = "SUA_DATADOG_APP_KEY"
    ```

### 3. Execute o Terraform

1.  **Inicialize o Terraform** (isso também configurará o backend S3):
    ```bash
    terraform init
    ```

2.  **Planeje a Infraestrutura** para revisar as mudanças:
    ```bash
    terraform plan
    ```

3.  **Aplique as Configurações** para provisionar os recursos:
    ```bash
    terraform apply
    ```

## Acessando o Cluster

Após a criação, configure o `kubectl` para se conectar ao novo cluster:
```bash
aws eks update-kubeconfig --region $(terraform output -raw aws_region) --name $(terraform output -raw cluster_name)
```

Verifique a conexão listando os nós:
```bash
kubectl get nodes
```

## Considerações de Segurança

*   **Credenciais Sensíveis:** As chaves do Datadog e a senha do Grafana são informações sensíveis. Utilize um arquivo `terraform.tfvars` (ignorado pelo Git) ou variáveis de ambiente (`export TF_VAR_datadog_api_key="..."`) para fornecê-las. Nunca as comite no repositório.
*   **Rede:** Por padrão, os nós de trabalho são implantados em sub-redes privadas para maior segurança, sem acesso direto da internet. O acesso externo é gerenciado por Load Balancers.

## Destruindo a Infraestrutura

Para remover todos os recursos criados pelo Terraform no ambiente, execute o comando:
```bash
terraform destroy
```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir um Pull Request ou uma Issue para sugerir melhorias ou corrigir bugs.

## Licença

Este projeto está licenciado sob a Licença MIT.

