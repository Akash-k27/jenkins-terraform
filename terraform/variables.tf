variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}
variable "instance_id" {
  description = "ID of the instance to associate the Elastic IP with"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for Jenkins EC2"
  type        = string
}
// ...existing code...
variable "vpc_id" {
  description = "VPC id where the security group will be created"
  type        = string
}
variable "iam_role_arn" {
  description = "IAM role ARN used by the DLM lifecycle policy"
  type        = string
}
// ...existing code...
variable "key_name" {
  description = "SSH key name"
  type        = string
}
