resource "aws_security_group" "csr_mgmt_sg" {
  name        = "csr_mgmt"
  description = "Security group for Mgmt CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} Mgmt SG"
  }
}

resource "aws_security_group" "csr_public_sg" {
  name        = "csr_public"
  description = "Security group for public CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} Public SG"
  }
}

resource "aws_security_group" "csr_private_sg" {
  name        = "csr_private"
  description = "Security group for private CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} Private SG"
  }
}

resource "aws_security_group_rule" "csr_mgmt_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_mgmt_sg.id
}

resource "aws_security_group_rule" "csr_mgmt_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_mgmt_sg.id
}

resource "aws_security_group_rule" "csr_public_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_public_dhcp" {
  type              = "ingress"
  from_port         = 67
  to_port           = 67
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_public_ntp" {
  type              = "ingress"
  from_port         = 123
  to_port           = 123
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_public_snmp" {
  type              = "ingress"
  from_port         = 161
  to_port           = 161
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_public_esp" {
  type              = "ingress"
  from_port         = 500
  to_port           = 500
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_public_ipsec" {
  type              = "ingress"
  from_port         = 4500
  to_port           = 4500
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_public_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_public_sg.id
}

resource "aws_security_group_rule" "csr_private_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_private_sg.id
}

resource "aws_security_group_rule" "csr_private_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.csr_private_sg.id
}