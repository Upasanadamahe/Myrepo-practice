resource "aws_instance" "thriller" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  for_each      = toset(var.computerscience)

  tags = {
    Name = each.value 

  }

}
























# we are using for instances here , if required tried with other resources also 
# for_each      = toset(var.film)
#   count = length(var.sandboxes)
#   tags = {
    # Name = each.value # for a set, each.value and each.key is the same
#   }


#   tags = {
#     Name = var.sandboxes[count.index] # example for count
#   }