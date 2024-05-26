# multiprovider block in terraform is for multi-configuration 

# provider "aws" {
#   region ="us-east-1"
#   
# }

# provider "aws" {
#   region ="ap-south-1"
#   alias = "sunday"
# }
#  CASE 01
# resource "aws_instance" "server" {
#   ami = "ami-0bb84b8ffd87024d8"
#   instance_type ="t2.micro"
#   key_name ="mykey"
#   tags = {
#     Name ="server-new"
#   }
#  } 
# case 02
# resource "aws_instance" "server" {
#   ami = "ami-0bb84b8ffd87024d8" //change ami also 
#   instance_type ="t2.micro"  //check with the vpc +sg + subnet so that new instance will be created 
#   key_name ="mykey"   // otherwise no resource created in new region 
#   tags = {
#     Name ="server-new"
#   }
#   provider=aws.sunday
# }

# this error found so don't create any new resource with the same file becoz statefile does not has the old track for new region details 
#  so before creating resource on new region destroy the existing one with the file otherwise create resource in new file 
#  so that statefile will track the changes , otherwise same error found like no existing resource here 
#  terraform destroy

# No changes. No objects need to be destroyed.
#  after checking with the first region resource details , looks like tracking details not available in statefile 
# Either you have not created any objects yet or the existing objects were already deleted outside of Terraform.

# Destroy complete! Resources: 0 destroyed.
# │ Error: creating EC2 Instance: VPCIdNotSpecified: No default VPC for this user. GroupName is only supported for EC2-Classic and default VPC.        
# │       status code: 400, request id: 0dd5a7d7-079a-4fc5-83ef-828623eecb6f
# │
# │   with aws_instance.server,
# │   on main.tf line 12, in resource "aws_instance" "server":
# │   12: resource "aws_instance" "server" {
#  it will take the default provider details which aws-root credential with region us-east-1
#  if i set new provider here with same instance give provider =aws.sunday in resource block