resource "aws_instance" "ec2_test_instance" {
  ami           = var.ami_image
  instance_type = "t3.micro"

  key_name = var.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  vpc_security_group_ids = [
    aws_security_group.sg_ssh_eti.id,
    aws_security_group.sg_ping_eti.id,
    aws_security_group.sg_egrs_eti.id,
  ]

  tags = {
    Name        = "ec2 test instance"
    Environment = "test"
  }
}