resource "aws_security_group" "public" {
  name        = "${var.name}_csr_pub"
  description = "Security group for Public CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} Public SG"
  }
}

resource "aws_security_group" "private" {
  name        = "${var.name}_csr_lan"
  description = "Security group for private CSR ENI"
  vpc_id      = var.vpc_id

  tags = {
    "Name" = "${var.name} LAN SG"
  }
}

/* resource "aws_security_group_rule" "csr_mgmt_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
} */

resource "aws_security_group_rule" "csr_mgmt_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "csr_private_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}

resource "aws_security_group_rule" "csr_private_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private.id
}