module "avx-demo-onprem-aws" {
  count               = var.cloud_type == "aws" ? 1 : 0
  source              = "github.com/gleyfer/aviatrix-demo-onprem-aws"
  hostname            = var.hostname
  tunnel_proto        = var.tunnel_proto
  network_cidr        = var.network_cidr
  public_subnets      = var.public_subnets
  private_subnets     = var.private_subnets
  public_subnet_ids   = var.public_subnet_ids
  private_subnet_ids  = var.private_subnet_ids
  instance_type       = var.aws_instance_type
  public_conns        = var.public_conns
  private_conns       = var.private_conns
  csr_bgp_as_num      = var.csr_bgp_as_num
  create_client       = var.create_client
  advertised_prefixes = var.advertised_prefixes
  az1                 = var.az1
  az2                 = var.az2
}

module "avx-demo-onprem-azure" {
  count          = var.cloud_type == "azure" ? 1 : 0
  source         = "github.com/gleyfer/aviatrix-demo-onprem-azure"
  azure_rg       = var.azure_rg
  azure_location = var.azure_location
  hostname       = var.hostname
  network_cidr   = var.network_cidr
  public_sub     = var.public_subnets
  private_sub    = var.private_subnets
  instance_type  = var.azure_instance_size
  public_conns   = var.public_conns
  private_conns  = var.private_conns
  csr_bgp_as_num = var.csr_bgp_as_num
  create_client  = var.create_client
}

