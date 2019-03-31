#!/bin/bash

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

#sudo apt-get install -y docker-ce

# Allow vagant user to run docker
#sudo usermod -a -G docker vagrant


# install git 

#sudo apt-get install -y git

# clone my github repo 

#sudo git clone https://github.com/zeineldin/docker-nginx-sandbox.git
#cd docker-nginx-sandbox

# build the docker immage named testnginx

#sudo docker build -t testnginx .

# run docker 

#sudo docker run -d -p 80:80 testnginx


#install ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

