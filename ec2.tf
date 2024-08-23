# creating linux server for nginx
resource "aws_instance" "myec2" {
  ami           = "ami-0ae8f15ae66fe8cda"
  instance_type = "t2.micro"
  key_name       = data.aws_key_pair.ec2key.key_name

  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "nginx"
  }
  //providing connection with ssh key manually created
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = data.aws_key_pair.ec2key.key_name
    host        = self.public_ip
  }
  # here iam using provisioner to execute commands in the server
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install nginx",
      "sudo systemctl start nginx"
    ]
  }
}
// iam using output to take ip adress to check insted of going to console
output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.myec2.public_ip
}
