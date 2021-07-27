terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 3.25"
		}
		aviatrix = {
			source = "AviatrixSystems/aviatrix"
			version = "~> 2.19"
		}
	}
}

provider "aws" {
	region = var.aws_region
	access_key = var.aws_access_key
	secret_key = var.aws_secret_key
}

provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = var.username
  password      = var.password
}

module "avx-demo-onprem" {
  source 					    = "github.com/gleyfer/aviatrix-demo-onprem"
  hostname					  = var.hostname
  vpc_cidr					  = var.vpc_cidr
  public_sub				  = var.public_sub
  private_sub				  = var.private_sub
  instance_type				= var.instance_type
  public_conns				= var.public_conns
  private_conns				= var.private_conns
  csr_bgp_as_num			= var.csr_bgp_as_num
  create_client				= var.create_client
}
