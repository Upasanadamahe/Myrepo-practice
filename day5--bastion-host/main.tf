resource "aws_vpc" "myvpc11" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "custom-vpc"
    }
  
}
# create subnet this is public one
resource "aws_subnet" "subnetpublic" {
    vpc_id = aws_vpc.myvpc11.id
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "mysubnetpub"
    } 
    
}
# create subnet this is private one
resource "aws_subnet" "subnetprivate" {
    vpc_id = aws_vpc.myvpc11.id
    cidr_block = "192.168.2.0/24"
    tags = {
      Name = "mysubnetpvt"
    } 
    
}
# create internategateway + create connection internategateway to vpc
resource "aws_internet_gateway" "ig" {
    
    vpc_id = aws_vpc.myvpc11.id
    tags = {
     Name= "New-IG"
    }
  
}
#  creating Nat-gateway with public subnet
# resource "aws_nat_gateway" "nat" {
# subnet_id = aws_subnet.subnetpublic.id
#  allocation_id  = aws_eip.nat_eip.id
# tags = {
  # Name = "nat-gt"
# }
# }
# The error message indicates that when creating an AWS NAT Gateway, the AllocationId parameter is required when the connectivity type is set to "public". This AllocationId refers to the Elastic IP (EIP) address that the NAT Gateway will use.

# To resolve this issue, you need to associate an Elastic IP (EIP) address with your NAT Gateway. Here's how you can do it:
# resource "aws_eip" "nat_eip" {
  # vpc = true
# }

#  create pvt route table with route edits
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.myvpc11.id
  tags = {
    Name ="pvt-RT"

  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  
}
# edit route for subnet associataion + pvtrt
resource "aws_route_table_association" "private-rt" {
  subnet_id  =  aws_subnet.subnetprivate.id
route_table_id = aws_route_table.private-rt.id
}
# create connection with edit route >> internategateway to routetable
resource "aws_route_table" "routetable01pub" {
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
 subnet_id  =  aws_subnet.subnetpublic.id
route_table_id = aws_route_table.routetable01pub.id
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

#  create instance/server with same public ntwrk

resource "aws_instance" "ec2internet" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  tags = {
    Name="ec2withpub"
  }
  associate_public_ip_address = true  # Assign a public IP address

  subnet_id = aws_subnet.subnetpublic.id
 vpc_security_group_ids = [aws_security_group.guard.id]
  
}
#  create instance/server with same private ntwrk

resource "aws_instance" "ec2external" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "pvt"
  tags = {
    Name="ec2withpvt"
  }
  
  subnet_id = aws_subnet.subnetprivate.id
 vpc_security_group_ids = [aws_security_group.guard.id]
  
}