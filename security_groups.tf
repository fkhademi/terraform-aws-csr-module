resource "aws_security_group" "csr_mgmt_sg" {
  name        = "${var.name}_csr_mgmt"
  description = "Security group for Mgmt CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} Mgmt SG"
  }
}

resource "aws_security_group" "csr_public_sg" {
  name        = "${var.name}_csr_public"
  description = "Security group for public CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} Public SG"
  }
}

resource "aws_security_group" "csr_private_sg" {
  name        = "${var.name}_csr_lan"
  description = "Security group for private CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} LAN SG"
  }
}

resource "aws_security_group_rule" "csr_mgmt_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
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