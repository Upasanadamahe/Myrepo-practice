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
public_key= file("D:/.ssh/id_rsa.pub") 
}

#  so now after clear with errors proper path is correct in above line
# public_key = file("../.ssh/id_rsa.pub.") file("../../.ssh/id_rsa.pub")
# C:\Users\Dell/.ssh/id_rsa.pub.  this is created with command prompt in local laptop and inside c drive .ssh created inside some other folders 
#  now here my terraform folders are on d drive so that why moving the path of .ssh folder for that take copy and paste it on d drive 
#  then set the path with directory name and proper key name as it is , Inside file("")
# below examples for giving the path if the file is inside too much folders :
#  public_key = file("../ssh_keys/id_rsa_id.pub") ../.ssh/id_rsa.pub"
# public_key = file("~/.ssh/id_rsa.pub")  file("D:/path/to/your/public_key.pub")
#  if key is private one so path is diff.  "~/.ssh/id_rsa" 
#  if u want to give path to ur user data we are using file function ,so in public_key assigning file function 
# file function are use to call the path of files / contains instruction /folder-file actual path to store upload something inside
# so meaining is that am creating key which is public key inisde the remote console with resource block 
#  and calling /uploading that key in the instance like am calling path of the key to uplaod key using filefuncn
# so creating public key first then uploded in the resource which ec2-instance after that ec2 will be generated only  