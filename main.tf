/*
# The configuration for the `remote` backend.
terraform {
    backend "remote" {
        # The name of your Terraform Cloud organization.
        organization = "knowbase"
        # The name of the Terraform Cloud workspace to store Terraform state files in.
        workspaces {
          name = "spicy-octo-adventure"
        }
   }
}
*/


provider "aws" {
    region     = var.aws_region
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
    build_suffix = random_id.build_suffix.hex

    #Deploy AWS infra(vpc, sg, etc) - Required for all AWS assets (BIG-IP, EKS, Monitoring, JuiceShop)
    create_infra = var.create_infra
    aws_region = var.aws_region
    azs = var.azs

    #Deploy EKS - Needed for monitoring and juiceshop
    create_eks_cluster = var.create_eks_cluster
    route_table_id = var.route_table_id
    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
    public_subnet_ids = var.public_subnet_ids
    private_subnet_ids = var.private_subnet_ids
    admin_src_addr = var.admin_src_addr


}