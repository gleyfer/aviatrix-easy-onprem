output "CSR_Public_IP" {
  value = var.cloud_type == "aws" ? module.avx-demo-onprem-aws[0].public_ip : module.avx-demo-onprem-azure[0].public_ip
}
output "CSR_SSH_Cmd" {
  value = var.cloud_type == "aws" ? module.avx-demo-onprem-aws[0].ssh_cmd_csr : module.avx-demo-onprem-azure[0].ssh_cmd_csr
}
output "Client_SSH_Cmd" {
  value = var.cloud_type == "aws" ? module.avx-demo-onprem-aws[0].ssh_cmd_client : module.avx-demo-onprem-azure[0].ssh_cmd_client
}
