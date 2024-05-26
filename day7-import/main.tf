resource "aws_instance" "import" {
  ami= "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "pvt"
  tags= {
              Name ="007"
            }
            subnet_id = "subnet-00de687fbf436cccd"
}