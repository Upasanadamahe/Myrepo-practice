#  it is a meta argument ,locals are used to define multiple arguments inside here or long string related information 
#  in variable-blocks  i can also define the value but it is works for individual strings only like dev, test, not for multiple arguments


locals {
      bucket-name = "${var.layer}${var.env}"

      # don't include any other thing with variable calling so only calling 2 diff. variables "" here
    #    resource name ="$(var.name of variable in terraform).xyz" if want to add more varible here use $(var.variablename)
        # directly give the value so resource name = "actual value"
        # before - i can declare/use var.variablename
        #  only declaring bucket here not creating bucket

#      with -   I see, the error indicates that S3 bucket names can't contain parentheses. Let's adjust the bucket name accordingly. If you need to combine "$(var.layer)" and "$(var.env)" without hyphens, 
        # you might consider concatenating them directly without any special characters. Here's an example:

# bash
# Copy code
# "$(var.layer)$(var.env)buckethyderabad001"
          }

resource "aws_s3_bucket" "bucket" {
 bucket = local.bucket-name   
#   instead of using bucket name in above line , i just define local. only in those place where i need the resource name
  tags = {
    Name = local.bucket-name
    Environment = var.env
  }
}