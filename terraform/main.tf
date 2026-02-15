module "jenkins_sg" {
  source = "./modules/security_group"
  vpc_id = var.vpc_id
}

module "jenkins_iam" {
  source = "./modules/iam"
}

module "jenkins_ec2" {
  source = "./modules/ec2"

  ami_id               = var.ami_id
  instance_type        = "t3.micro"
  key_name             = var.key_name
  security_group_id    = module.jenkins_sg.security_group_id
  iam_instance_profile = module.jenkins_iam.instance_profile_name
}

module "jenkins_eip" {
  source      = "./modules/eip"
  instance_id = module.jenkins_ec2.instance_id
}

module "jenkins_dlm" {
  source        = "./modules/dlm"
  iam_role_arn = module.jenkins_iam.dlm_role_arn
}
