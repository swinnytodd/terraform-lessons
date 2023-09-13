output "webserver_instace_id" {
  value = aws_instance.my_webserver.id
}


output "webserver_sg_id" {
  value = aws_security_group.my_webserver.id

}

output "webserver_sg_arn" {
  value = aws_security_group.my_webserver.arn

}
#terrafrom output