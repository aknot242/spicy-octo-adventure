

# Create Elastic IP
resource "aws_eip" "main" {
  count = var.create_nat_gateway ? 1 : 0
  vpc              = true
}

# Create NAT Gateway
resource "aws_nat_gateway" "main" {
  count = var.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.main[0].id
  subnet_id     = var.public_subnet_ids[0]

  tags = {
    resource_owner = var.resource_owner
    Name          = format("%s-ngw-%s", var.project_prefix, var.build_suffix)
  }
}

module subnet_addrs {
  for_each = toset(var.azs)
  source          = "hashicorp/subnets/cidr"
  version         = "1.0.0"
  base_cidr_block = cidrsubnet(var.eks_cidr,2,index(var.azs,each.key))
  networks        = [
    {
      name     = "eks-internal"
      new_bits = 1
    },
    {
      name     = "eks-external"
      new_bits = 1
    }
  ]
}

resource "aws_subnet" "eks-internal" {
  for_each = toset(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = module.subnet_addrs[each.key].network_cidr_blocks["eks-internal"]
  availability_zone = each.key
  tags              = {
    Name = format("%s-eks-int-subnet-%s",var.project_prefix,each.key)
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"                      = "1"
  }
}
resource "aws_subnet" "eks-external" {
  for_each = toset(var.azs)
  vpc_id            = var.vpc_id
  cidr_block        = module.subnet_addrs[each.key].network_cidr_blocks["eks-external"]
  map_public_ip_on_launch = true
  availability_zone = each.key
  tags              = {
    Name = format("%s-eks-ext-subnet-%s",var.project_prefix,each.key)
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
}
resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = local.nat_gateway_id
  }
  tags = {
    Name = format("%s-eks-rt-%s", var.project_prefix, var.build_suffix)
  }
}
resource "aws_route_table_association" "internal-subnet-association" {
  for_each       = toset(var.azs)
  subnet_id      = aws_subnet.eks-internal[each.key].id
  route_table_id = aws_route_table.main.id
}
resource "aws_route_table_association" "external-subet-association" {
  for_each = toset(var.azs)
  subnet_id = aws_subnet.eks-external[each.key].id
  route_table_id = var.vpc_main_route_table_id
}



