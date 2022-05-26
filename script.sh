#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io -y
mkdir ~/jenkins
#sudo chmod 777 jenkins
mkdir ~/sonarqube
cd sonarqube
mkdir ~/sonarqube/data ~/sonarqube/logs ~/sonarqube/extensions
cd ..
sleep 2
sudo docker run -itd -p 8080:8080 -p 50000:50000 -v ~/jenkins:/var/jenkins_home --name jenkins jenkins/jenkins:lts-jdk11
sleep 5
sudo docker run -itd -p 9000:9000\
 -v ~/sonarqube/data:/opt/sonarqube/data\
 -v ~/sonarqube/logs:/opt/sonarqube/logs\
 -v ~/sonarqube/extensions:/opt/sonarqube/extensions\
 --name sonarqube sonarqube
sleep 5
sudo docker logs jenkins | grep password -A 2
sudo docker logs jenkins | grep password -A 2 > ~/jenkins/password.txt
