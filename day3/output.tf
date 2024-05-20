# output "ip" {
#   value = aws_instance.name.public_ip
#   description = "this is public-ip of instance called name"
  
# }

# output "arn" {
#   value = aws_s3_bucket.bucket.arn
#   description = "this is amazon-resource name for aws-s3-bucket"
# }
# in line2 meaning is am giving value for output to my ec2-instance with name now aws_instance is type of resource and .name is the name inside Local-terraform here
# and .public_ip is the title in terraform registry for printing pub-ip
#  so here aws_instance +.name+ .public_ip gives the value for printing my instance with public -ip
#  but  few things secret here don't want to show them directly so use keyword sensitive
# like this sensitive = true , on above lines its value is false so i can see publicipdetails in output -block