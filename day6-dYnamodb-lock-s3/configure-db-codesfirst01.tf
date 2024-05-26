# STEP1) THIS IS NOT COMPLETE NOLY TABLE CREATED 
# resource "aws_dynamodb_table" "dynamo" {
#   name = "terraform-dynamodb-statefile-01"
#   hash_key="LockID"
#   read_capacity =20
#   write_capacity =20
#   attribute{
#    name ="LockID"
#    type="S"
#    dynamodb:GetItem 
#    dynamodb:PutItem
#   }
# }

# step2) so this iam policy that grant permission for accessing dynamodb table does not directly used with code , do i need to create a new iam user separeately ?

#  Yes, you're correct. The IAM policy that grants permissions for accessing the DynamoDB table is not directly associated with any specific code. Instead, you would typically attach this IAM policy to an IAM user or role within your AWS account.

# Here's the typical workflow:

# Create IAM Policy: Define an IAM policy, like the one we created earlier, which grants the necessary permissions (dynamodb:GetItem and dynamodb:PutItem) for interacting with the DynamoDB table.

# Create IAM User or Role: Depending on your use case, you can either create a new IAM user or IAM role. If this IAM user or role is specifically for Terraform operations, you might name it accordingly, such as "terraform-user" or "terraform-role".

# Attach IAM Policy: Once the IAM user or role is created, you would then attach the IAM policy that you created earlier to this IAM user or role. This grants the necessary permissions to the user or role for interacting with the DynamoDB table.

# Configure Terraform to Use IAM User or Role: In your Terraform configuration, specify the IAM user's access key and secret key or IAM role's ARN. This allows Terraform to authenticate and perform actions within your AWS account with the permissions granted by the attached IAM policy.

# By following this approach, you can ensure that Terraform has the necessary permissions to manage resources like DynamoDB tables within your AWS account, while also following the principle of least privilege by only granting the minimum permissions required.

# step3) No, the code I provided does not create a role for the root user. Instead, it creates an IAM policy that grants permissions for accessing a DynamoDB table and then attaches this policy to an IAM role or user.
# how it works:

# IAM Policy: The aws_iam_policy resource defines an IAM policy named "DynamoDBAccessPolicy". This policy contains permissions (dynamodb:GetItem and dynamodb:PutItem) required for interacting with the DynamoDB table.

# DynamoDB Table: The aws_dynamodb_table resource defines a DynamoDB table named "terraform-dynamodb-statefile-01" with a hash key "LockID". This resource does not handle IAM permissions directly.

# IAM Role/User: You would separately define an IAM role or user (depending on your use case) that Terraform will use to interact with AWS resources. This role/user should have permissions attached to it, such as the IAM policy we created, in order to perform actions like creating or modifying the DynamoDB table.

# IAM Policy Attachment: After creating the IAM policy, you would attach it to the IAM role or user defined in step 3 using the aws_iam_policy_attachment resource.

# So, in summary, the code provided creates an IAM policy for DynamoDB access and allows you to attach it to any IAM role or user of your choice, not necessarily the root user. It's important to avoid using the root user for day-to-day operations and instead create IAM users or roles with the minimum permissions required.



# step3) code this code for attaching policy to the Iam -user created by root

# step4 )
# resource "aws_iam_policy" "dynamodb_policy" {
#   name        = "DynamoDBAccessPolicy"
#   description = "Allows access to DynamoDB table for Terraform state management"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect   = "Allow",
#         Action   = [
#           "dynamodb:GetItem",
#           "dynamodb:PutItem",
#           // Add other necessary actions here if applicable
#         ],
#         Resource = aws_dynamodb_table.dynamo.arn,
#       },
#     ],
#   })
# }

# The DynamoDB table is defined without specifying IAM permissions within its configuration.
# An IAM policy named "DynamoDBAccessPolicy" is defined separately using the aws_iam_policy resource. This policy allows dynamodb:GetItem and dynamodb:PutItem actions on the specified DynamoDB table.
# The IAM policy is then attached to an IAM role or user used by Terraform to manage resources, granting the necessary permissions for interacting with the DynamoDB table.
# Separating the IAM policy from the DynamoDB table definition allows for better organization and management of permissions within your Terraform configuration.
