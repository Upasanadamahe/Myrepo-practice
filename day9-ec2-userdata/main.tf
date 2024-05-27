resource "aws_instance" "userdata" {
 ami = "ami-0bb84b8ffd87024d8"
 instance_type = "t2.micro"
 key_name = "mykey"
 tags = {
   Name = "ec2-userdata"
 }
  user_data = file("files.sh")
}