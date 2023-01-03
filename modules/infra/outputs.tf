# Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}
output "public_subnet_ids" {
  value = [values(aws_subnet.external)[0].id, values(aws_subnet.external)[1].id]
}
output "eks_cidr" {
  value = values(module.subnet_addrs)[0].network_cidr_blocks.eks-cidr
}
output "vpc_main_route_table_id" {
  value = aws_route_table.main.id
}


