locals {
    cluster_name = format("%s-eks-cluster-%s", var.project_prefix, var.build_suffix)
}