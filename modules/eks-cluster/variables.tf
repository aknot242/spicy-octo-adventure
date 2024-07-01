#Project Globals
variable "project_prefix" {
  type        = string
  default     = "demo"
  description = "This value is inserted at the beginning of each object (alpha-numeric, no special character)"
}
variable "resource_owner" {
  type        = string
  description = "owner of the deployment, for tagging purposes"
# default     = "myName"
}
variable "build_suffix" {
  description = "random id"
  type = string
}
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}

#AWS
variable "vpc_id" {
  type        = string
  description = "The AWS network VPC ID"
  default     = null
}
variable "nat_gateway_id" {
  type = string
  description = "NAT GW ID specify when create_infra is set to false"
}
variable "vpc_main_route_table_id" {
  type = string
  description = "Main route table id"
}
variable "eks_cidr" {
  type = string
}

variable "public_cidr_blocks" {
  type        = list(any)
  default     = ["10.1.10.0/24", "10.1.110.0/24"]
  description = "External subnet address prefixes"
}
variable "private_cidr_blocks" {
  type        = list(any)
  default     = ["10.1.20.0/24", "10.1.120.0/24"]
  description = "Internal subnet address prefixes"
}

variable "public_subnet_ids" {
  type = list(any)
}

variable "azs" {
  description = "Availability Zones"
  type        = list
}
variable "eks_addons" {
  type = list(object({
    name    = string
  }))

  default = [
    {
      name    = "kube-proxy"
    },
    {
      name    = "vpc-cni"
    },
    {
      name    = "coredns"
      version = "v1.11.1-eksbuild.9"
    }
  ]
}

#Onboarding
variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Set to true to if deploying to an existing vpc (create_infra = false) and require a ngw"
}
variable "create_eks_cluster" {
  type        = bool
  default     = false
  description = "Set to true to create EKS cluster"
}
