#  #####--- before apply the code plz check details.tf

provider "aws" {
  region ="us-east-1"
  
}

# provider "aws" {
#   region ="ap-south-1"
#   alias = "sunday"
# }

resource "aws_instance" "server" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type ="t2.micro"
  key_name ="mykey"
  tags = {
    Name ="server-new"
  }
  
}

