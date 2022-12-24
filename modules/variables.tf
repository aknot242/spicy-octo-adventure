#Project Globals
variable "project_prefix" {
  type        = string
  description = "This value is inserted at the beginning of each AWS object (alpha-numeric, no special character)"
}
variable "resource_owner" {
  type        = string
  description = "owner of the deployment, for tagging purposes"
}
variable "build_suffix" {
  type = string
  description = "random id"
}

#ONBOARDING
variable "create_infra" {
  type        = bool
  default     = false
  description = "Set to true to create infra"
}
variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Programatically set to false if NG has been created in another module"
}
variable "create_eks_cluster" {
  type        = bool
  default     = false
  description = "Set to true to create EKS cluster for Monitoring and Juiceshop modules"
}

#AWS INFRA
variable "aws_region" {
  description = "aws region"
  type        = string
#  default     = "us-west-2"
}
variable azs {
  description = "Availability Zones"
  type        = list
  default     = ["us-west-1a", "us-west-1b"]
}
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}
variable "external_sg_id" {
  type        = string
  description = "External securitiy group ID"
  default     = null
}
variable "management_sg_id" {
  type        = string
  description = "Management securitiy group ID"
  default     = null
}
variable "internal_sg_id" {
  type        = string
  description = "Internal securitiy group ID"
  default     = null
}
variable "route_table_id" {}

variable "private_subnets" {}
variable "public_subnets" {}
variable "public_subnet_ids" {}
variable "private_subnet_ids" {}

variable "eks_cidr" {
  type = string
  default = null
}