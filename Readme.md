This repository will help you install Mediawiki on AWS in fully automated fashion using Terraforma, AWS cli and Ansible. Terraform is responsible for provisioning infrastructure on AWS while Ansible helps install Mediawiki.

# Diagrams - Infra
![alt text](./mediawiki.jpeg)

# Diagram - Execution
Traffic arrives on load balancer and get routed to web servers in public subnet
Web servers can only make calls to DB server in private subnet

# How to Execute Terrform Scripts
## Plan
terrform plan

## Apply
terraform apply

## Destroy
terraform destroy

# How to Execute Ansible Playbook independent of Terraform
ansible-playbook -i non-production master-install-mediawiki.yaml --extra-vars "mysql_root_password=***"

# Things to consider
Check python version of destination machines. If version <= 3 then please comment "ansible_python_interpreter" in group_vars
Pre-bake your image and provide ami-id in terraform.tfvars
The path for key file in terraform compute code is specific to my system location. You need to change the location as per your resources.
