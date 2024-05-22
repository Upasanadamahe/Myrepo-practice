# create s3 with region ,s3 is to keep statefile for entire repo "Myrepo-practice"its a one time job 
# createing versioning for s3 
#  in s3 only resources stored with same region if it is diff.. region so diff.. bucket for that region 
#  inside s3 ,diff. folders for diff. files like one bucket for multiple projects in one region

resource "aws_s3_bucket" "statefile" {
  bucket = "statefile001-project--devops--terraform"
  
}
#  creating s3 bucket
# resource "aws_s3_bucket" "example_bucket" {
  # bucket = "yourbucketname0"
  # acl    = "private"
# }


# resource "aws_s3_bucket_versioning" "versioning" {
  # bucket = aws_s3_bucket.statefile.id
  # versioning_configuration {
    # status = "enable/disable"
  # }
# }
#  for backup of same s3 bucket replicas are there with diff. region like replicas allow buckets 
#  created with same name in diff. region so any updates on original one it will be updated on diff.region bucket as well
#  but to access / delete the bucket on diff. region i have to check them separately like direclty if original s3 bucket is deleted in one region 
#  still becoz of replicas it is available in diff. region that why s3 is gloabl but created service on regional basis