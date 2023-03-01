#Restrict Default VPC SG
resource "aws_default_security_group" "restrict_dsg" {
  vpc_id = module.vpc.vpc_id
  tags = {
    Name  = format("%s-default-sg-%s", var.project_prefix, var.build_suffix)
    Owner = var.resource_owner
  }
}
