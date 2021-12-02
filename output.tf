output "mgmt_public_ip" {
  value = aws_eip.mgmt.public_ip
}

output "lan_interface" {
  value = aws_network_interface.lan
}

output "public_sg" {
  value = aws_security_group.public
}

output "private_sg" {
  value = aws_security_group.private
}