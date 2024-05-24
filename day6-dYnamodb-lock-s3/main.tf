resource "aws_s3_bucket" "statefile" {
  bucket = "statefile001-project--devops--terraform"
# acl = "private"
  
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.statefile.id
  versioning_configuration {
    status = "enable"
    # status = "enable/disable"
  }
}
#  this is common structure for dynam-dbtable
resource "aws_dynamodb_table" "dynamo" {
  name = "terraform-dynamodb-statefile-01"
  hash_key="LockID"
  read_capacity =20
  write_capacity =20
  attribute{
   name ="LockID"
   type="S"
  }
}
#  this is common backend structure 
terraform {
  backend "s3" {
    bucket = "statefile001-project--devops--terraform"
    key = "terraform.tfstate"
    # region = "us-east-1"
    
    dynamodb_table = "terraform-dynamodb-statefile-01"
    # dynamodb_table ="terraform-dynamodb-statefile-01"
    encrypt = true
    }
}
# #  this is common backend structure 
# terraform {
#   backend "s3" {
#     bucket = "name of the bucket where u place the project"
#     key = "path/to/my/key"means in s3 filename=keyname ,what is the file/folder key name indirectly filename system can understand keyname,name of the file/folder
#     region = "code of region where this bucket created"
#     }
#    dynamodb_table ="terraform-dynamodb-statefile-01"
#     encrypt = true
# }

#  creating s3 bucket
# resource "aws_s3_bucket" "example_bucket" {
  # bucket = "yourbucketname0"
  # acl    = "private"
# }