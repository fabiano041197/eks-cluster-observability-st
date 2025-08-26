terraform {
  backend "s3" {
    bucket         = "seu-bucket-de-tfstate-aqui" # Crie um bucket S3 e coloque o nome aqui
    key            = "eks-cluster/qa/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock" # Crie uma tabela DynamoDB com a chave primária "LockID" (string)
    encrypt        = true
  }
}