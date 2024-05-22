# create s3 bucket 
#  create versioning 
#  create configuration of s3 in diff. directory for storing statefile 
#  statefile only generate when am running for example instance with apply, destroy cmd 
#  so here am creating one resource , after terraform apply the resource will take place in remote 
#  and associated statefile will be generated in local configuration right so after s3 bucket created 
#  so here i run resource and actions captured in statefile which is inside s3 bucket ,a common terraform- backend syntax below for that 
# resource "aws_" "name" {
  
# }
# terraform {
  # backend "s3" {
    # bucket = "statefilebucketforMyrepo-practice"
    # key = "/folder/terraform.tfstate"
    # region = "us-east-1"
  # }
# }
#  explaination here for backend s3 will be created now for checking the files inside s3 
#  goto lineno.13 bucket= bucketname then goto the file/folder name= directly filename or folder name then gotofile
#  region means this entire bucket is created with particular region so the resources inside files must be with same region only 

# terraform {
#   backend "s3" {
    # bucket = "name of the bucket where u place the project"
    # key = "path/to/my/key"means in s3 filename=keyname ,what is the file/folder key name indirectly filename system can understand keyname,name of the file/folder
    # region = "code of region where this bucket created"
#   }
