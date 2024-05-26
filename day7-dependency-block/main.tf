resource "aws_instance" "sunday" {
    ami = var.ami
    key_name = var.key_name
    instance_type = var.instance_type
    tags = {
      Name ="sunday"
    }

  
}

resource "aws_instance" "friday" {
    ami = var.ami
    key_name = var.key_name01
    instance_type = var.instance_type
    tags = {
      Name="friday"
    }
    depends_on = [ aws_instance.sunday]
  
}