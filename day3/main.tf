# resource "aws_instance" "name" {
    # ami = var.ami
    # instance_type = var.instance_type
    # key_name = var.key_name
    # tags = {
    #   Name = "my-server"
    # }

#   }


resource "aws_s3_bucket" "example_bucket" {
  bucket = "yourbucketname0"
  acl    = "private"
}

#   resource "aws_s3_bucket" "bucket" {
    
    # bucket = "rightnow"
    # acl    = "private"

#   }
# it is the name of S3-bucket , it is created in anyone region becoz s3 is global but service created is on regional basis
# like if i specify a region inside resource block so bucket will be created inside a region now here by default region is considered with root details
#  becoz inside provider block i already specify region there so default region is same with the root credentials, itself 