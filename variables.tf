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
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}
#test
variable "public_subnets" {}
variable "private_subnets" {}
variable "public_subnet_ids" {}
variable "private_subnet_ids" {}
variable "route_table_id" {}

