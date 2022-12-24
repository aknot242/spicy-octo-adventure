#INFRA Outputs
output "vpc_cidr_block" {
  description = "CIDR Block"
  value       = module.onboarding.vpc_cidr_block
}
output "vpc_id" {
  description = "VPC ID"
  value       = module.onboarding.vpc_id
}
output "eks_cidr" {
  value = module.onboarding.eks_cidr
}
#EKS Outputs
output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.onboarding.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.onboarding.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.onboarding.cluster_name
}

