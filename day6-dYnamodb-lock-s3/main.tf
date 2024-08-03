 resource "aws_instance" "yahoo" {
ami = "ami-0bb84b8ffd87024d8"
 instance_type = "t2.micro"
 key_name = "mykey"
 tags = {
   Name = "yahooo"
 }
  
 }

 resource "aws_s3_bucket" "statefile" {
   bucket = "statefile001-project--devops"
   # acl =""
 }
#  NOTe important :: before deleting bucket first check backend configuration 
#  after backend , dbtable for backend configuation successfully deleted go to delete the bucket objects 
# to delete bucket and versions , first delete content inside object then suspend versioning 
#  delete the bucket 
 #aws_s3_bucket_versioning.version will be created
  # #status     = "Suspended"
# aws s3 rm s3://statefile001-project--devops --recursive
#resource "aws_s3_bucket_versioning" "version" {
 #bucket = aws_s3_bucket_versioning.version.id
  #bucket = aws_s3_bucket.statefile.id
#   versioning_configuration {
#     # enabled = false
#     status = "Suspended"
#     # status = "enable/disable"
#   }
 #}
#   warning ::this is common backend structure but follow this configure-db-codesfirst01.tf 
#  this is common structure for dynam-dbtable
 #resource "aws_dynamodb_table" "dynamo" {
#   name = "terraform-dynamodb-statefile-01"
#   hash_key="LockID"
#   read_capacity =20
#   write_capacity =20
#   attribute{
#    name ="LockID"
#    type="S"
#   }
# }
#  warning ::this is common backend structure but follow this configure-db-codesfirst01.tf 
 #terraform {
 #  backend "s3" {
#     bucket = "statefile001-project--devops"
#     key = "terraform.tfstate"
#     region = "us-east-1"
#   }
#   }
    
#     dynamodb_table = "terraform-dynamodb-statefile-01"
# #     # dynamodb_table ="terraform-dynamodb-statefile-01"
#     encrypt = true
#     }
#  }

# #  this is common backend structure , for doing this configuration changed to remote-s3(files-folders) so commands used 
# aws configure 
# terraforminit , terraform init -reconfigure , terraform init -migrate-state 
# to change the configuration otherwise terraform commands not works becoz in local old statefile is considered 
#  even u create remote s-3 statefile but it will not configered here untill you configure providers and plugins  with terraform commands

# terraform {
#   backend "s3" {
#     bucket = "name of the bucket where u place the project"
#     key = "path/to/my/key"means in s3 filename=keyname ,what is the file/folder key name indirectly filename system can understand keyname,name of the file/folder
#     region = "code of region where this bucket created"
#     }}
#    dynamodb_table ="terraform-dynamodb-statefile-01"
#     encrypt = true
# }

#  creating s3 bucket
# resource "aws_s3_bucket" "example_bucket" {
  # bucket = "yourbucketname0"
  # acl    = "private"
# }