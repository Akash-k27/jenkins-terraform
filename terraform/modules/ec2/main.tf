resource "aws_instance" "jenkins" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]

  iam_instance_profile = var.iam_instance_profile

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "jenkins-server"
  }
}
