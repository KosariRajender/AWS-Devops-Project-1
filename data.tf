# The name of default security group
data "aws_vpc" "default" {
  default = true
}
# The name of the manually created IAM group
data "aws_iam_group" "existing_group" {
  group_name = "Admin"  
}
data "aws_key_pair" "ec2key" {
  key_name           = "terraform-key"
  include_public_key = true
}

