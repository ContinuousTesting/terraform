#!/usr/bin/env bash
# AWS linux ec2 instance Development env NodeJS, GIT, MAven, Java 1.8 awscli

sudo yum update -y
#install git
sudo yum install -y git
# Install apache maven
sudo touch /etc/yum.repos.d/epel-apache-maven.repo
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
# Install java-1.8.0
sudo yum install -y java-1.8.0
# sudo yum remove -y java-1.7.0-openjdk
echo 2 | sudo update-alternatives --config java
# Configure Java development env set Java home /ec2-user
echo '
export JAVA_HOME="/usr/lib/jvm/jre-1.8.0-openjdk.x86_64"
PATH=$JAVA_HOME/bin:$PATH
' >> /home/ec2-user/.bashrc
sudo source /home/ec2-user/.bashrc
# install AWS CLI
sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
sudo unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
# Install Nodejs
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
. ~/.nvm/nvm.sh
export NVM_DIR="/home/ec2-user/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 4.4.5
node -e "console.log('Running Node.js ' + process.version)"
# install gulp
npm install --global gulp-cli
#Install docker 
sudo yum install docker 
