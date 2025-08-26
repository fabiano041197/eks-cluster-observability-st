output "node_group_name" {
  description = "Nome do node group criado"
  value       = aws_eks_node_group.default.node_group_name
}

output "node_group_arn" {
  description = "ARN do node group"
  value       = aws_eks_node_group.default.arn
}

output "asg_names" {
  description = "Nomes dos Auto Scaling Groups gerenciados pelo node group (use estes para buscar instance ids)"
  value       = aws_eks_node_group.default.resources[0].autoscaling_groups[*].name
}