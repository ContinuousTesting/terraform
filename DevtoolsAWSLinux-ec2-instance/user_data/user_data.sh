#!/usr/bin/env bash
# AWS linux ec2 instance Development env NodeJS, GIT, MAven, Java 1.8 awscli

sudo yum update -y
#install git
sudo yum install -y git

#Install Oracle Java Jdk1.814
cd /tmp
sudo wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm
sudo yum install -y jdk-8u141-linux-x64.rpm
echo 2 | sudo update-alternatives --config java

# Install apache maven
sudo touch /etc/yum.repos.d/epel-apache-maven.repo
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
# Configure Java development env set Java home /ec2-user
sudo echo '
export JAVA_HOME="/usr/java/jdk1.8.0_141/"
PATH=$JAVA_HOME/bin:$PATH
export M2_HOME="/usr/share/apache-maven"
export M2=$M2_HOME/bin
export MAVEN_OPTS=-Xms256m -Xmx512m
' >> /home/ec2-user/.bashrc
sudo echo '
export JAVA_HOME="/usr/java/jdk1.8.0_141/"
PATH=$JAVA_HOME/bin:$PATH
export M2_HOME="/usr/share/apache-maven"
export M2=$M2_HOME/bin
export MAVEN_OPTS=-Xms256m -Xmx512m
' >> /.bashrc
sudo source /home/ec2-user/.bashrc
sudo source /.bashrc
# install zip 7z
sudo yum install -y p7zip-full p7zip-rar zip
# install AWS CLI
sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
sudo unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
# Install Nodejs
# Install Nodejs
sudo yum install -y nodejs npm --enablerepo=epel
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
export NVM_DIR="~/.nvm" [ -s "$NVM_DIR/nvm.sh" ] &&  "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 4.4.5
npm install -g gulp
#Install docker
sudo yum install docker
