# Outputs
output "vpc_cidr_block" {
  description = "CIDR Block"
  value       = module.vpc.vpc_cidr_block
}
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}
output network_cidr_blocks {
  value = module.subnet_addrs
}
output "private_cidr_blocks" {
  value = [values(aws_subnet.internal)[0].cidr_block, values(aws_subnet.internal)[1].cidr_block]
}
output "public_cidr_blocks" {
  value  =  [values(aws_subnet.external)[0].cidr_block, values(aws_subnet.external)[1].cidr_block]
}
output "public_subnet_ids" {
  value = [values(aws_subnet.external)[0].id, values(aws_subnet.external)[1].id]
}
output "private_subnet_ids" {
  value = [values(aws_subnet.internal)[0].id, values(aws_subnet.internal)[1].id]
}

output "eks_cidr" {
  value = values(module.subnet_addrs)[0].network_cidr_blocks.eks-cidr
}
output "vpc_main_route_table_id" {
  value = aws_route_table.main.id
}


