

data "aws_subnet" "sbbb" {
    filter {
     name ="tag:Name"
     values = ["subnet001"]
    }
}
data "aws_key_pair" pair{
    filter {
        name ="key-name"
        values =["mykey"]
    }
}

resource "aws_instance" "meraserver" {
  ami = "ami-0bb84b8ffd87024d8"
  key_name =  data.aws_key_pair.pair.key_name
  instance_type="t2.micro"
  subnet_id = data.aws_subnet.sbbb.id
  tags = {
    Name ="nayaserver"
  }
}