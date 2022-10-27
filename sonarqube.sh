#!/bin/bash
## Author : Germaine
## Date : 10/26/2022


## Description : Sonarqube installation

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo yum install unzip -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64 
./sonar.sh start
sudo sytemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld

if firewall-cmd not active

then

sudo firewall-cmd --permanent --add-port=9000/tcp

sudo firewall-cmd --reload

fi

echo "Connect to the sonarqube server through your browser using the ip address:port 9000"

echo " Successfull sonarqube installation on Centos7"



