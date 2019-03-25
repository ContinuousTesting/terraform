# Provision an EC2 instance With SonarQuibe  in AWS Development enviroment

Provisions a AWS Linux  Base Image AMI (with ID ami-0cd3dfa4e37921605) with type t2.small ( will not eun on micro )  in the uus-east-2a region. The AMI ID, region, and type can all be set as variables. You can also set the name variable to determine the value set for the Name tag.

Note you need to set environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
# Add corected values to >> $HOME/.bash_profile
echo '
export AWS_ACCESS_KEY_ID="****CHANGEME********"
export AWS_SECRET_ACCESS_KEY="***CHANGEME*****"
' >> $HOME/.bash_profile

Usage :

terraform init
terraform plan
terraform apply

SonarQuibe will start on port 9000

