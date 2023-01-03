############################ VPC ############################

# Create VPC, subnets, route tables, and IGW
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "~> 3.0"
  name                 = format("%s-vpc-%s",var.project_prefix,var.build_suffix)
  cidr                 = var.vpc_cidr_block
  azs                  = var.azs
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    resource_owner = var.resource_owner
    Name = format("%s-vpc-%s",var.project_prefix,var.build_suffix)
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id
  tags   = {
    Name = format("%s-igw-%s",var.project_prefix,var.build_suffix)
  }
}

module subnet_addrs {
  for_each = toset(var.azs)
  source          = "hashicorp/subnets/cidr"
  version         = "1.0.0"
  base_cidr_block = cidrsubnet(module.vpc.vpc_cidr_block,4,index(var.azs,each.key))
  networks        = [
    {
      name     = "external"
      new_bits = 6
    },
    {
      name     = "eks-cidr"
      new_bits = 4
    }
  ]
}
resource "aws_subnet" "external" {
  for_each = toset(var.azs)
  vpc_id            = module.vpc.vpc_id
  cidr_block        = module.subnet_addrs[each.key].network_cidr_blocks["external"]
  map_public_ip_on_launch = true
  availability_zone = each.key
  tags              = {
    Name = format("%s-ext-subnet-%s",var.project_prefix,each.key)
  }
}
resource "aws_route_table" "main" {
  vpc_id = module.vpc.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = format("%s-rt-%s",var.project_prefix,var.build_suffix)
  }
}
resource "aws_route_table_association" "subnet-association-external" {
  for_each       = toset(var.azs)
  subnet_id      = aws_subnet.external[each.key].id
  route_table_id = aws_route_table.main.id
}