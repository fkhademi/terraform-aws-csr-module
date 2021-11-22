output "public_ip" {
  value = aws_eip.csr_public_eip.public_ip
}

output "mgmt_public_ip" {
  value = aws_eip.csr_mgmt_eip.public_ip
}

output "lan_interface" {
  value = aws_network_interface.lan
}