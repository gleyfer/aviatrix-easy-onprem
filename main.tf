module "avx-demo-onprem-aws" {
  count          = var.cloud_type == "aws" ? 1 : 0
  source         = "github.com/gleyfer/aviatrix-demo-onprem-aws" 
  hostname       = var.hostname
  network_cidr   = var.network_cidr
  public_sub     = var.public_sub
  private_sub    = var.private_sub
  instance_type  = var.aws_instance_type
  public_conns   = var.public_conns
  private_conns  = var.private_conns
  csr_bgp_as_num = var.csr_bgp_as_num
  create_client  = var.create_client
}

module "avx-demo-onprem-azure" {
  count          = var.cloud_type == "azure" ? 1 : 0
  source         = "github.com/gleyfer/aviatrix-demo-onprem-azure"
  azure_rg       = var.azure_rg
  azure_location = var.azure_location
  hostname       = var.hostname
  network_cidr   = var.network_cidr
  public_sub     = var.public_sub
  private_sub    = var.private_sub
  instance_type  = var.azure_instance_size
  public_conns   = var.public_conns
  private_conns  = var.private_conns
  csr_bgp_as_num = var.csr_bgp_as_num
  create_client  = var.create_client
}
