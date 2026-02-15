resource "aws_eip" "jenkins" {
  instance = var.instance_id
}
