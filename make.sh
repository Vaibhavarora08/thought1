#! /bin/bash
cd /home/ubuntu/thought/terraform
terraform init
terraform plan
terraform apply --auto-approve

