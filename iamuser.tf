resource "aws_iam_user" "lb" {
  name = "testing"
}
# Add the IAM user to the existing IAM group
resource "aws_iam_user_group_membership" "user_in_group" {
  user   = aws_iam_user.lb.name
  groups = [data.aws_iam_group.existing_group.group_name] 
}