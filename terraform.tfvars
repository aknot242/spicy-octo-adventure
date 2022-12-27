#Onboarding
#AWS
create_infra = false
create_eks_cluster = false




#Global
project_prefix = "tf-cd-spicy-test"
resource_owner = "cdelano"
admin_src_addr  = "50.53.21.238/32"

#AWS INFRA
aws_region     = "us-east-1"
azs           = ["us-east-1a", "us-east-1b"]
public_subnet_ids = ["blah"]
private_subnet_ids = ["blah"]

#AWS EKS
route_table_id  = "random"
private_subnets = ["10.1.20.0/24", "10.1.120.0/24"]
public_subnets = ["10.3.10.0/24", "10.3.110.0/24"]

