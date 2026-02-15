output "jenkins_instance_id" {
  value = module.jenkins_ec2.instance_id
}

output "jenkins_public_ip" {
  value = module.jenkins_eip.public_ip
}
