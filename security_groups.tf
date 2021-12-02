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

# Inbound security group rules for public interface
resource "aws_security_group_rule" "one" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = "ICMP"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.public.id
    description       = "icmp"
} 

resource "aws_security_group_rule" "two" {
    type              = "ingress"
    from_port         = 12346
    to_port           = 13156
    protocol          = "UDP"
    cidr_blocks       = ["0.0.0.0/0"]
    security_group_id = aws_security_group.public.id
    description       = "DTLS"
} 

resource "aws_security_group_rule" "three" {
    type              = "ingress"
    from_port         = 22
    to_port           = 22
    protocol          = "TCP"
    cidr_blocks       = ["185.112.52.0/22"]
    security_group_id = aws_security_group.public.id
    description       = "SSH from CH01"
} 

resource "aws_security_group_rule" "four" {
    type              = "ingress"
    from_port         = 22
    to_port           = 22
    protocol          = "TCP"
    cidr_blocks       = ["194.30.181.0/24"]
    security_group_id = aws_security_group.public.id
    description       = "SSH from CH02"
} 
##

resource "aws_security_group_rule" "five" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = -1
  cidr_blocks       = ["52.221.135.94/32"]
  security_group_id = aws_security_group.public.id
  description       = "vbond-4"
} 

resource "aws_security_group_rule" "six" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["54.151.139.68/32"]
    security_group_id = aws_security_group.public.id
    description       = "vsmart-5"
} 

resource "aws_security_group_rule" "seven" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["52.29.35.167/32"]
    security_group_id = aws_security_group.public.id
    description       = "vmanage"
} 

resource "aws_security_group_rule" "eight" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["34.192.15.19/32"]
    security_group_id = aws_security_group.public.id
    description       = "vsmart-4"
} 

resource "aws_security_group_rule" "nine" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["18.235.204.12/32"]
    security_group_id = aws_security_group.public.id
    description       = "vbond-3"
} 

resource "aws_security_group_rule" "ten" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["54.74.48.147/32"]
    security_group_id = aws_security_group.public.id
    description       = "vbond-2"
} 

resource "aws_security_group_rule" "eleven" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["18.192.225.137/32"]
    security_group_id = aws_security_group.public.id
    description       = "vsmart-1"
} 

resource "aws_security_group_rule" "twelve" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["52.5.190.61/32"]
    security_group_id = aws_security_group.public.id
    description       = "vsmart-3"
} 

resource "aws_security_group_rule" "thirteen" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["54.74.133.23/32"]
    security_group_id = aws_security_group.public.id
    description       = "vsmart-2"
} 

resource "aws_security_group_rule" "fourteen" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["18.158.122.46/32"]
    security_group_id = aws_security_group.public.id
    description       = "vbond-1"
} 

resource "aws_security_group_rule" "fifteen" {
    type              = "ingress"
    from_port         = -1
    to_port           = -1
    protocol          = -1
    cidr_blocks       = ["18.140.33.99/32"]
    security_group_id = aws_security_group.public.id
    description       = "vsmart-6"
} 

# Outbound security group rules for public interface
resource "aws_security_group_rule" "csr_mgmt_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

# Security group rules for private interface
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