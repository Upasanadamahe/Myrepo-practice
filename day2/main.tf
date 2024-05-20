 resource "aws_instance" "name" {
     ami = var.ami
     instance_type = var.instance_type
    key_name = var.key_name
    tags = {
        Name="my-server"
    }
  
 }
