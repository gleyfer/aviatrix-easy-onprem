terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.25"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.72"
    }
    aviatrix = {
      source  = "AviatrixSystems/aviatrix"
      version = "~> 2.19.5"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}

provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = var.username
  password      = var.password
}

module "avx-demo-onprem" {
  source         = "github.com/gleyfer/aviatrix-demo-onprem"
  cloud_type     = var.cloud_type
  azure_rg       = var.azure_rg
  azure_location = var.azure_location
  hostname       = var.hostname
  network_cidr   = var.network_cidr
  public_sub     = var.public_sub
  private_sub    = var.private_sub
  instance_type  = var.instance_type
  public_conns   = var.public_conns
  private_conns  = var.private_conns
  csr_bgp_as_num = var.csr_bgp_as_num
  create_client  = var.create_client
}
