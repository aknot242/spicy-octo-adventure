#Onboarding
#AWS
create_infra = true
create_eks_cluster = false

#Global
project_prefix = "tf-cd-spicy"
resource_owner = "cdelano"
admin_src_addr  = "50.53.21.238/32"

#AWS INFRA

aws_region     = "us-east-1"
azs           = ["us-east-1a", "us-east-1b"]
vpc_cidr_block = "10.0.0.0/16"


#AWS EKS
vpc_id = "vpc-0b071aeb0b5299579"
eks_cidr = "10.0.2.0/24"
vpc_main_route_table_id  = "rtb-0248fa43df0ab7072"
nat_gateway_id = "nat-0de130c25447d505c"


