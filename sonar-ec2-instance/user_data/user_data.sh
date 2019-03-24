#!/usr/bin/env bash
# AWS linux ec2 instance with Java , GIT and SonarQube

sudo yum update -y
#install git
sudo yum install -y git
# Install java-1.8.0
sudo yum install -y java-1.8.0
# sudo yum remove -y java-1.7.0-openjdk
echo 2 | sudo update-alternatives --config java
# Configure Java development env set Java home /ec2-user
echo '
export JAVA_HOME="/usr/lib/jvm/jre-1.8.0-openjdk.x86_64"
PATH=$JAVA_HOME/bin:$PATH
' >> /home/ec2-user/.bashrc
# Install sonar
sudo wget -O /etc/yum.repos.d/sonar.repo http://downloads.sourceforge.net/project/sonar-pkg/rpm/sonar.repo
sudo yum install -y sonar
