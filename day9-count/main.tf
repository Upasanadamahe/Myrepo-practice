# for the below codes we are using count operation for creating instances but we are not giving values to the count 
# we are defining a variable and calling the length of variable so no need assign value in count here now 
# in the variable , the no. values inside a variable is the length of variable 
# which is equal to the count in line .9,so this is dynamic one like 8 values inside variable so value for count is 8 
#  for creating resources with count is fine but if i want to remove resource in the middle so it is not possible , difficult to find actually what resource id is deleted in background
#   deletion is in descending orders 
resource "aws_instance" "yahoo"{
    ami ="ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    key_name = "mykey"
    count = length(var.xyz)
    tags = {
      Name = var.xyz[count.index]
    }
}

#  IN the below code for count 3  we are calling variable with the count of index ,here variable contains list of strings
# resource "aws_instance" "yahoo"{
#     ami ="ami-0bb84b8ffd87024d8"
#     instance_type = "t2.micro"
#     key_name = "mykey"
#     count = 3
#     tags = {
#       Name = var.xyz[count.index]
#     }
# }
#   this gives the values along with name under tags tab like myserver-0, myserver-1 
#  resource "aws_instance" "yahoo"{
#     ami ="ami-0bb84b8ffd87024d8"
#     instance_type = "t2.micro"
#     key_name = "mykey"
#     count = 2
#     tags = {
#       Name = "myserver-${count.index}"
#     }
# }


# count operation starts with 0 ,1,2..
# resource "aws_instance" "yahoo"{
#     ami ="ami-0bb84b8ffd87024d8"
#     instance_type = "t2.micro"
#     key_name = "mykey"
#     count = 2
#     tags = {
#       Name = "myserver"
#     }
# }
