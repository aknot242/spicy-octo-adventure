#LOCALS
locals {
  vpc_id            = var.create_infra ? module.infra[0].vpc_id : var.vpc_id
  vpc_main_route_table_id = var.create_infra ? module.infra[0].vpc_main_route_table_id : var.vpc_main_route_table_id
  public_subnet_ids = var.create_infra ? module.infra[0].public_subnet_ids : var.public_subnet_ids
  eks_cidr = var.create_infra ? module.infra[0].eks_cidr : var.eks_cidr
  create_nat_gateway = var.create_infra ? true : var.create_nat_gateway
}