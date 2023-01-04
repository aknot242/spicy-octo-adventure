locals {
    cluster_name = format("%s-eks-cluster-%s", var.project_prefix, var.build_suffix)
    nat_gateway_id = var.create_nat_gateway ? aws_nat_gateway.main[0].id : var.nat_gateway_id
}