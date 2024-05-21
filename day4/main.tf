# to create custom-network 
# create vpc 
resource "aws_vpc" "myvpc11" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "custom-vpc"
    }
  
}
# create subnet
resource "aws_subnet" "subnet01" {
    vpc_id = aws_vpc.myvpc11.id
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "mysubnet"
    } 
    
}
# create internategateway + create connection internategateway to vpc
resource "aws_internet_gateway" "ig" {
    
    vpc_id = aws_vpc.myvpc11.id
    tags = {
     Name= "New-IG"
    }
  
}
# create connection with edit route >> internategateway to routetable
resource "aws_route_table" "routetable01" {
vpc_id = aws_vpc.myvpc11.id
tags = {
  Name="myroute-table"
}
# edit route> routetable to subnet association 
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
}
# create security group > define rules inbound= ingress ,outbound =engress
resource "aws_route_table_association" "editroute" {
 subnet_id  =  aws_subnet.subnet01.id
route_table_id = aws_route_table.routetable01.id
}
resource "aws_security_group" "guard" {
     name ="guard"
    vpc_id = aws_vpc.myvpc11.id
    tags = {
      Name="custom-sg"
    }
  ingress {
    # description = "from vpc"
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "tcp"
    from_port = 22
    to_port = 22
  }
  egress {
    
    cidr_blocks = ["0.0.0.0/0"]
    protocol = "-1"
    from_port = 0
    to_port = 0
  }
}

#  create instance/server with same ntwrk

resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name="server007"
  }
  
  subnet_id = aws_subnet.subnet01.id
 security_groups = [aws_security_group.guard.id]
  # in the above line [] is becoz multiple values are there for role , so always inside sg use []
}