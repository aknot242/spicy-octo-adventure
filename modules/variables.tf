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
}
variable vpc_id {
  description = "Specify if create_infra = false"
  type = string
}
variable vpc_cidr_block {
  description = "Specify if create_infra = false"
  type = string
}
variable azs {
  description = "Availability Zones"
  type        = list
  default     = ["us-west-1a", "us-west-1b"]
}
variable "nat_gateway_id" {
  type = string
  description = "NAT GW ID specify when create_infra is set to false"
}
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}
variable "vpc_main_route_table_id" {
  description = "Route table ID to apply when deploying to existing VPC"
}
variable "eks_cidr" {
  type = string
  default = null
}