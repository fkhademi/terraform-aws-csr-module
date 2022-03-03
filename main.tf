resource "aws_network_interface" "pub" {
  subnet_id         = var.pub_subnet_id
  security_groups   = [aws_security_group.public.id]
  source_dest_check = false

  tags = {
    "Name" = "${var.name} Public Interface"
  }
}

resource "aws_network_interface" "lan" {
  subnet_id         = var.lan_subnet_id
  security_groups   = [aws_security_group.private.id]
  source_dest_check = false

  tags = {
    "Name" = "${var.name} Private Interface"
  }
}

resource "aws_eip" "pub" {
  vpc               = true
  network_interface = aws_network_interface.pub.id

  tags = {
    "Name" = "${var.name} Public IP"
  }
}

data "aws_ami" "csr_aws_ami" {
  owners = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["cisco_CSR-.17.3.1a-BYOL-624f5bb1-7f8e-4f7c-ad2c-03ae1cd1c2d3-ami-0032671e883fdd77a.4"]
  }
}

data "aws_instance" "csr" {
  get_user_data = true
  filter {
    name   = "tag:Name"
    values = [var.name]
  }
  depends_on = [aws_instance.csr]
}

resource "aws_key_pair" "key" {
  key_name   = "${var.name}-key"
  public_key = var.ssh_key
}

resource "aws_instance" "csr" {
  ami           = data.aws_ami.csr_aws_ami.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key.key_name

  network_interface {
    network_interface_id = aws_network_interface.pub.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.lan.id
    device_index         = 1
  }

  user_data_base64 = "${base64encode(var.user_data_base64)}"

  tags = {
    "Name" = var.name
  }
}
