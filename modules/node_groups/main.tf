resource "aws_eks_node_group" "default" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.cluster_name}-ng-default"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_size
    max_size     = var.max_size
  }

  instance_types = var.instance_type != "" ? [var.instance_type] : ["t3.medium"]

  ami_type = "AL2023_x86_64_STANDARD"

  lifecycle {
    ignore_changes = [
      remote_access,   # ignora mudanças nesse bloco
      labels,          # ignora mudanças nas labels
      update_config,   # ignora mudanças nessa configuração
    ]
  }

  tags = {
    Name = "${var.cluster_name}-ng-default"
  }

}