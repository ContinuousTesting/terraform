# Provision an EC2 instance in AWS
This Terraform configuration provisions an EC2 instance in AWS.
Provisions a AWS Linux  Base Image AMI (with ID ami-0cd3dfa4e37921605) with type t2.micro in the uus-east-2a region. The AMI ID, region, and type can all be set as variables. You can also set the name variable to determine the value set for the Name tag.

# run aws config  


Usage :

terraform init
terraform plan
terraform apply

Jenkins will start on port 8080 
