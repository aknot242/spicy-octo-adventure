#Onboarding
#AWS
create_infra = false
create_eks_cluster = true
create_nat_gateway = true

#Global
project_prefix = "tf-cd-spicy"
resource_owner = "cdelano"
admin_src_addr  = "50.53.21.238/32"

#AWS INFRA

aws_region     = "us-east-1"
azs           = ["us-east-1a", "us-east-1b"]
vpc_cidr_block = "10.0.0.0/16"


#AWS EKS
#Provide if using an existing VPC
vpc_id = "vpc-02545726fdc44fece"
eks_cidr = "10.0.2.0/24"
vpc_main_route_table_id  = "rtb-03bf89c6960033143"
#Provide if create_ngw is false
nat_gateway_id = "ngw ID"
#Provide if create_infra is set to false and create_ngw is true
public_subnet_ids = ["subnet-0481ec9c1da0d15bd","subnet-0bec37c7fa5eeabfb"]


