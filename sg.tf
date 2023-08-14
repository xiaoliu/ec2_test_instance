data "external" "localinterface" {
  program = ["${path.module}/scripts/obtain_ext_ip.sh"]
}

# Enable ssh from local IP
resource "aws_security_group" "sg_ssh_eti" {
  name        = "sg_igrs_ssh"
  description = "Allow ssh from current ip"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ data.external.localinterface.result.ip ]
  }
}

# Enable ping from local IP
resource "aws_security_group" "sg_ping_eti" {
  name        = "sg_igrs_ping"
  description = "Allow ping from current ip"

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [ data.external.localinterface.result.ip ] #[ data.external.localinterface.result.ip ]
  }
}

# Egress allow all
resource "aws_security_group" "sg_egrs_eti" {
  name        = "sg_egrs_all"
  description = "Allow all egress traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}