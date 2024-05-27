resource "aws_instance" "pairing" {
 ami = "ami-0bb84b8ffd87024d8"
 instance_type = "t2.micro"
 key_name = aws_key_pair.pair.key_name
  tags = {
    Name="ec2+keys"
  }
}
resource "aws_key_pair" "pair" {

key_name = "public"
public_key = file("~/.ssh/id_rsa.pub")
#  if key is private one so path is diff.  "~/.ssh/id_rsa"
#  if u want to give path to ur user data we are using file function ,so in public_key assigning file function 
# file function are use to call the path of files / content instruction /folder-file actual path to store upload something inside

}

# so meaining is that am creating key which is public key inisde the remote console with resource block 
#  and calling /uploading that key in the instance like am calling path of the key to uplaod key using filefuncn
# so creating public key first then uploded in the resource which ec2-instance after that ec2 will be generated only  