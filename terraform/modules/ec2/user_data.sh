#!/bin/bash
set -e

yum update -y

amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

usermod -aG docker ec2-user

yum install git -y

cd /opt
git clone https://github.com/Akash-k27/jenkins-terraform.git

cd jenkins-terraform/docker-compose
/usr/local/bin/docker-compose up -d
