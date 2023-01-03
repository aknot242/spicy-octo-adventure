#AWS Infra
module infra {
  count        = var.create_infra ? 1 : 0
  source       = "./infra"
  aws_region = var.aws_region
  vpc_cidr_block = var.vpc_cidr_block
  azs = var.azs
  admin_src_addr = var.admin_src_addr
  project_prefix = var.project_prefix
  resource_owner = var.resource_owner
  build_suffix = var.build_suffix
}

#EKS
module "eks_cluster" {
  count = var.create_eks_cluster ? 1 : 0
  source = "./eks-cluster"
  project_prefix = var.project_prefix
  build_suffix = var.build_suffix
  resource_owner = var.resource_owner
  vpc_id = local.vpc_id
  azs = var.azs
  vpc_main_route_table_id = local.vpc_main_route_table_id
  create_infra = var.create_infra
  nat_gateway_id = var.nat_gateway_id
  admin_src_addr = var.admin_src_addr
  public_subnet_ids = local.public_subnet_ids
  eks_cidr = local.eks_cidr
}