#AWS INFRA Outputs
output "vpc_cidr_block" {
  description = "CIDR Block"
  value       = var.create_infra ? module.infra[0].vpc_cidr_block : null
}
output "vpc_id" {
  description = "VPC ID"
  value       = var.create_infra ? module.infra[0].vpc_id : null
}
output "eks_cidr" {
  value = var.create_infra ? module.infra[0].eks_cidr : null
}
output "network_cidr_blocks" {
  value = var.create_infra ? module.infra[0].network_cidr_blocks : null
}


#EKS Outputs
output "cluster_id" {
  description = "EKS cluster ID"
  value       = var.create_eks_cluster ? module.eks_cluster[0].cluster_id : null
}

output "cluster_endpoint" {
 description = "Endpoint for EKS control plane"
  value       = var.create_eks_cluster ? module.eks_cluster[0].cluster_endpoint : null
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = var.create_eks_cluster ? module.eks_cluster[0].cluster_name : null
}

/*
#test
output "private_subnets" {
  value = var.create_infra ? module.infra[0].private_cidr_blocks : null
}
output "public_subnets" {
  value = var.create_infra ? module.infra[0].public_cidr_blocks : null
}
output "public_subnet_ids" {
  value = var.create_infra ? module.infra[0].public_subnet_ids : null
}
output "private_subnet_ids" {
  value = var.create_infra ? module.infra[0].private_subnet_ids : null
}
output "vpc_main_route_table_id" {
  value = var.create_infra ? module.infra[0].vpc_main_route_table_id : null
}
output "external_sg_id" {
  value = var.create_infra ? module.infra[0].external_sg_id : null
}
output "internal_sg_id" {
  value = var.create_infra ? module.infra[0].internal_sg_id : null
}
output "management_sg_id" {
  value = var.create_infra ? module.infra[0].management_sg_id : null
}
*/