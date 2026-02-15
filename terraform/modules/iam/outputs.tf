output "dlm_role_arn" {
  value = aws_iam_role.dlm_role.arn
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.jenkins_profile.name
}
