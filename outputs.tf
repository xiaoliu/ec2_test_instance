output "server_public_ip" {
  description = "Public IP of wg server"
  value       = aws_instance.ec2_test_instance.public_ip
}
