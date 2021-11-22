output "public_ip" {
  value = aws_eip.pub.public_ip
}

output "mgmt_public_ip" {
  value = aws_eip.mgmt.public_ip
}

output "lan_interface" {
  value = aws_network_interface.lan
}