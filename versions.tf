terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = ">= 4"
    kubernetes = {
      version = "~>2.16.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.7.0"
    }
  }
}