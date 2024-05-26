
resource "aws_instance" "test001" {
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
   
    key_name = "mykey"
    
  tags = {
    Name = "yummy"
  }

}


#below examples are for lifecycle meta_arguments 

#   lifecycle {
#     create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
#   }

# lifecycle {
#   prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
# }


#   lifecycle {
#     ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
#   }

