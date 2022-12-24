#LOCALS
locals {
  vpc_id            = var.create_infra ? module.infra[0].vpc_id : data.aws_vpc.default[0].id
  vpc_cidr_block   = var.create_infra ? module.infra[0].vpc_cidr_block : data.aws_vpc.default[0].cidr_block
  #external_sg_id   = var.create_infra ? module.infra[0].external_sg_id : var.external_sg_id
  #management_sg_id   = var.create_infra ? module.infra[0].management_sg_id : var.management_sg_id
  #internal_sg_id   = var.create_infra ? module.infra[0].internal_sg_id : var.internal_sg_id
  vpc_main_route_table_id = var.create_infra ? module.infra[0].vpc_main_route_table_id : var.route_table_id
  
  public_cidr_blocks = var.create_infra ? module.infra[0].public_cidr_blocks : var.public_subnets
  private_cidr_blocks = var.create_infra ? module.infra[0].private_cidr_blocks : var.private_subnets
  public_subnet_ids = var.create_infra ? module.infra[0].public_subnet_ids : var.public_subnet_ids
  private_subnet_ids = var.create_infra ? module.infra[0].private_subnet_ids : var.private_subnet_ids
  
  eks_cidr = var.create_infra ? module.infra[0].eks_cidr : var.eks_cidr
  create_nat_gateway = var.create_eks_cluster ? false : true
}