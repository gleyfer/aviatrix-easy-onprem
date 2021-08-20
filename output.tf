output "CSR_Public_IP" {
  value = module.avx-demo-onprem.public_ip
}
output "CSR_SSH_Cmd" {
  value = module.avx-demo-onprem.ssh_cmd_csr
}
output "Client_SSH_Cmd" {
  value = module.avx-demo-onprem.ssh_cmd_client
}
output "CSR_Custom_Data" {
  value = module.avx-demo-onprem.user_data
  sensitive = true
}
