#AWS INFRA Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = var.create_infra ? module.infra[0].vpc_id : var.vpc_id
}
output "eks_cidr" {
  value = var.create_infra ? module.infra[0].eks_cidr : var.eks_cidr
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
