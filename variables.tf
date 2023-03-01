#Project Variables
#Onboarding
variable "create_infra" {
  type        = bool
  default     = false
  description = "Set to true to create infra"
}
variable "create_eks_cluster" {
  type        = bool
  default     = false
  description = "Set to true to create EKS cluster for Monitoring and Juiceshop modules"
}
variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Set to true to if deploying to an existing vpc (create_infra = false) and require a ngw"
}

#Global
variable "project_prefix" {
  type        = string
  default     = "demo"
  description = "This value is inserted at the beginning of each AWS object (alpha-numeric, no special character)"
}
variable "resource_owner" {
  type        = string
  description = "owner of the deployment, for tagging purposes"
  default     = "myName"
}

#AWS Infra
variable vpc_id {
  description = "Specify if create_infra = false"
  type = string
}
variable vpc_cidr_block {
  description = "the CIDR block for the Virtual Private Cloud (VPC) of the deployment"
  default = "10.0.0.0/16"
  type    = string
  validation {
    condition = can(regex("^([0-9]{1,3}.){3}[0-9]{1,3}($|/(16|24))$",var.vpc_cidr_block))
    error_message = "The value must conform to a CIDR block format."
  }
}
variable eks_cidr {
  description = "the CIDR block for the EKS deployment"
  default = "10.0.2.0/16"
  type    = string
/*
  validation {
    condition = can(regex("^([0-9]{1,3}.){3}[0-9]{1,3}($|/(16|24))$",var.eks_cidr))
    error_message = "The value must conform to a CIDR block format."
  }
*/
}

variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "us-west-2"
}
variable azs {
  description = "Availability Zones"
  type        = list
  default     = ["us-west-2a", "us-west-2b"]
}
variable "nat_gateway_id" {
  type = string
  description = "NAT GW ID specify when create_infra is set to false"
}
variable "vpc_main_route_table_id" {
  type = string
  description = "VPC route table ID"
}
variable "public_subnet_ids" {
  type = list(any)
  description = "Provide if infra is set to false and create_nat_gateway is set to true"
}
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}


