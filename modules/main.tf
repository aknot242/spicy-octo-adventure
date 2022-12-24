#AWS Infra
module infra {
  count        = var.create_infra ? 1 : 0
  source       = "./infra"
  aws_region = var.aws_region
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
  vpc_cidr_block = local.vpc_cidr_block
  azs = var.azs
  vpc_main_route_table_id = local.vpc_main_route_table_id
  admin_src_addr = var.admin_src_addr  
  private_cidr_blocks = local.private_cidr_blocks
  public_cidr_blocks = local.public_cidr_blocks
  public_subnet_ids = local.public_subnet_ids
  private_subnet_ids = local.private_subnet_ids
  eks_cidr = local.eks_cidr
}