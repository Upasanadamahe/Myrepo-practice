resource "aws_instance" "name01" {
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    key_name = "mykey"

    tags = {
      Name = "tree"
    }

    
}

resource "aws_instance" "name02" {
    
  ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    key_name = "mykey"

    tags = {
      Name = "linked-list"
    }
}
#terraform apply -target=aws_s3_bucket.name #apply or destroy particular resource

#  generate keys in public and private create one ec2 with diff. keys
#terraform apply -target=aws_s3_bucket.name #apply or destroy particular resource

# terraform destroy -target=aws_instance.name01