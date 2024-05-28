#  warning : for provisioner check details1.tf 
# 
resource "aws_instance" "name" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"
  key_name = aws_key_pair.pair.key_name
  tags = {
    Name= "myserver"
  }
  
connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("D:/.ssh/id_rsa")
    host= self.public_ip
    } 
    }

 resource "aws_key_pair" "pair" {

      key_name = "public"
      public_key= file("D:/.ssh/id_rsa.pub") 
}
# warning : output block works only when you create dns or ip for server in main(instance/ec2)resource block 
output "server_ip" {
  value = aws_instance.name.public_ip
}