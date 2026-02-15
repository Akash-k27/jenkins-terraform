# Jenkins on AWS using Terraform and Docker Compose

## Overview
This project provisions infrastructure to run Jenkins on AWS EC2 using Terraform.
Jenkins is deployed using Docker Compose with persistent storage.

## Architecture
- AWS EC2 for Jenkins host
- Elastic IP for static access
- Docker Compose for Jenkins deployment
- EBS-backed Docker volume for persistence
- AWS DLM for daily EBS snapshots

## Jenkins Deployment
- Jenkins runs as a Docker container
- Data persisted at /var/jenkins_home
- Same Docker Compose works locally and on EC2

## Backup Strategy
- AWS Data Lifecycle Manager (DLM)
- Daily snapshots
- 7-day retention
- Tag-based EBS volume selection

## Cost Control
Terraform was validated and planned but not applied to avoid unnecessary AWS costs.
Jenkins is demonstrated locally using the same Docker Compose configuration.

## How EC2 Bootstraps Jenkins
EC2 user-data installs Docker, Docker Compose, clones this repository,
and runs Jenkins using docker-compose.  
