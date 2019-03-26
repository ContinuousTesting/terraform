#!/usr/bin/env bash
# AWS linux ec2 instance Development env NodeJS, GIT, MAven, Java 1.8 awscli

sudo yum update -y
#install git
sudo yum install -y git
cd $home
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
# install AWS CLI
cd $home
sudo curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
sudo unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
# Install and start docker
# sudo yum install -y docker
# sudo service docker start
# Install Nexus Artifactory
# sudo adduser nexus
# wget www.sonatype.org/downloads/nexus-2.11.2-03-bundle.tar.gz
# wget http://www.sonatype.org/downloads/nexus-latest-bundle.tar.gz
# tar xvzf nexus-2.11.2-03-bundle.tar.gz
# sudo mv nexus-2.11.2-03 /opt/
# cd /opt
# mv nexus-2.11.2-03/ nexus
# cd /opt/nexus
# sudo mv $home/sonatype-work /data/sonatype-work
# sudo chown nexus:nexus nexus -R
# sudo chown nexus:nexus /data -R
# cd /opt
# sudo ln -s /data/sonatype-work sonatype-work

# tail -200f /data/sonatype-work/nexus/logs/nexus.log

wget http://download.sonatype.com/nexus/oss/nexus-latest-bundle.tar.gz
sudo cp nexus-latest-bundle.tar.gz /usr/local
cd /usr/local
sudo tar -xvzf nexus-latest-bundle.tar.gz
sudo rm nexus-latest-bundle.tar.gz
sudo ln -s nexus-2.14.12-02 nexus
sudo chown -R ec2-user:ec2-user nexus
sudo chown -R ec2-user:ec2-user nexus-2.14.12-02
# sudo chown -R ec2-user:ec2-user sonatype-work
nexus/bin/nexus start 
# Nexus will run on port HOST_NAME:8081/nexus/
#sudo cp nexus/bin/nexus /etc/init.d/nexus
# sudo chkconfig --add nexus
# sudo service nexus start
