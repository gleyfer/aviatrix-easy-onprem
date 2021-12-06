variable "cloud_type" {
  description = "Which CSP to deploy the CSR1Kv in"
  type        = string
  default     = "aws"
}
variable "aws_region" {
  description = "AWS Region in which to deploy the CSR 1KV"
  type        = string
  default     = "us-east-1"
}
variable "azure_location" {
  description = "Azure Region in which to deploy the CSR 1KV"
  type        = string
  default     = "East US"
}
variable "azure_rg" {
  description = "Existing Azure Resource Group into which to deploy"
  type        = string
  default     = null
}
variable "aws_access_key" {
  description = "AWS API Access key"
  type        = string
  default     = ""
}
variable "aws_secret_key" {
  description = "AWS API Access secret"
  type        = string
  default     = ""
}
variable "controller_ip" {
  description = "Aviatrix Controller IP"
  type        = string
  default     = ""
}
variable "username" {
  description = "Aviatrix Controller User Name"
  type        = string
  default     = ""
}
variable "password" {
  description = "Aviatrix Controller Password"
  type        = string
  default     = ""
}
variable "hostname" {
  description = "CSR hostname"
  type        = string
  default     = "onprem-csr"
}
variable "tunnel_proto" {
  type    = string
  default = "IPsec"
}
variable "prioritize" {
  description = "Possible values: price, performance. Instance ami adjusted depending on this"
  type        = string
  default     = "price"
}
variable "network_cidr" {
  description = "Virtual Network CIDR"
  type        = string
  default     = "172.16.0.0/16"
}
variable "public_subnets" {
  description = "Public Subnet CIDR"
  type        = list(string)
  default     = ["172.16.0.0/24"]
}
variable "public_subnet_ids" {
  description = "Use existing CSR Public subnet ids"
  type        = list(string)
  default     = null
}
variable "private_subnets" {
  description = "Public Subnet CIDR"
  type        = list(string)
  default     = ["172.16.1.0/24"]
}
variable "private_subnet_ids" {
  description = "Use existing CSR Private subnet ids"
  type        = list(string)
  default     = null
}
variable "aws_instance_type" {
  description = "AWS CSR Instance type"
  type        = string
  default     = "t3.medium"
}
variable "azure_instance_size" {
  description = "Azure CSR Instance size"
  type        = string
  default     = "Standard_DS2_v2"
}
variable "public_conns" {
  description = "List of public External Conns"
  type        = list(string)
  default     = []
}
variable "private_conns" {
  description = "List of private External Conns"
  type        = list(string)
  default     = []
}
variable "csr_bgp_as_num" {
  description = "CSR BGP AS Number"
  type        = string
  default     = "64527"
}
variable "create_client" {
  description = "Create Test Client"
  type        = bool
  default     = false
}
variable "advertised_prefixes" {
  type        = list(string)
  description = "List of custom advertised prefixes to send over BGP to Transits"
  default     = []
}
variable "az1" {
  type        = string
  description = "Primary AZ"
  default     = "a"
}
variable "az2" {
  type        = string
  description = "Secondary AZ"
  default     = "b"
}
