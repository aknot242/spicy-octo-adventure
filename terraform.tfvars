#Onboarding
#AWS
create_infra = true
create_eks_cluster = true

#Global
project_prefix = "spicy-test"
resource_owner = "cdelano"
admin_src_addr  = "50.53.21.238/32"

#AWS INFRA

aws_region     = "us-west-2"
azs           = ["us-west-2a", "us-west-2b"]
vpc_cidr_block = "10.1.0.0/18"


#AWS EKS - Only needed if using an existing VPC
vpc_id = ""
eks_cidr = ""
vpc_main_route_table_id  = ""
nat_gateway_id = ""
public_subnet_ids = [ "blah" ]