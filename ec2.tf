# creating linux server for nginx 
resource "aws_instance" "myec2" {
  ami           = "ami-0ae8f15ae66fe8cda"
  instance_type = "t2.micro"
  key_name       = data.aws_key_pair.ec2key.key_name

  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "terraform"
  }
}
// iam using output to take ip adress to check insted of going to console
output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.myec2.public_ip
}
}
