
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Name      = var.project_prefix
      Owner     = var.resource_owner
      CreatedBy = var.resource_owner
    }
  }
}

# Create a random id
resource "random_id" "build_suffix" {
  byte_length = 2
}

module "onboarding" {
  source = "./modules"
  #Globals
  project_prefix = var.project_prefix
  resource_owner = var.resource_owner
  build_suffix   = random_id.build_suffix.hex
  #Deploy AWS infra(vpc, sg, etc)
  create_infra       = var.create_infra
  create_nat_gateway = var.create_nat_gateway
  aws_region         = var.aws_region
  azs                = var.azs
  vpc_id             = var.vpc_id
  vpc_cidr_block     = var.vpc_cidr_block
  #Deploy EKS
  create_eks_cluster      = var.create_eks_cluster
  eks_cidr                = var.eks_cidr
  vpc_main_route_table_id = var.vpc_main_route_table_id
  public_subnet_ids       = var.public_subnet_ids
  nat_gateway_id          = var.nat_gateway_id
  admin_src_addr          = var.admin_src_addr
}
