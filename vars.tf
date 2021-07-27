variable "aws_region" {
  description = "AWS Region in which to deploy the CSR 1KV"
  type        = string
}
variable "aws_access_key" {
  description = "AWS API Access key"
  type        = string
}
variable "aws_secret_key" {
  description = "AWS API Access secret"
  type        = string
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
variable "vpc_cidr" {
  description = "Aviatrix Controller Password"
  type        = string
  default     = "172.16.0.0/16"
}
variable "public_sub" {
  description = "Aviatrix Controller Password"
  type        = string
  default     = "172.16.0.0/24"
}
variable "private_sub" {
  description = "Aviatrix Controller Password"
  type        = string
  default     = "172.16.1.0/24"
}
variable "instance_type" {
  description = "CSR Instance type"
  type        = string
  default     = "t2.medium"
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
