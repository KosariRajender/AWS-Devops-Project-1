# The name of default security group
data "aws_vpc" "default" {
  default = true
}
# The name of the manually created IAM group
data "aws_iam_group" "existing_group" {
  group_name = "Admin"  
}
