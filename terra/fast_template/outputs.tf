output "public_ip" {
  value       = aws_instance.my_server_web.public_ip
  description = "The public IP address of the web server"
}