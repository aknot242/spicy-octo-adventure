# Variables

variable "project_prefix" {
  type        = string
#  default     = "demo"
  description = "This value is inserted at the beginning of each AWS object (alpha-numeric, no special character)"
}
variable "build_suffix" {
  description = "random id"
  type = string
}
variable "resource_owner" {
  type        = string
  description = "owner of the deployment, for tagging purposes"
#  default     = "myName"
}
variable "aws_region" {
  description = "aws region"
  type        = string
#  default     = "us-west-2"
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

variable "azs" {
  description = "Availability Zones"
  type        = list
}
variable "admin_src_addr" {
  type        = string
  description = "Allowed Admin source IP prefix"
  default     = "0.0.0.0/0"
}


