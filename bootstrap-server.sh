#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)

dir="ansible-playbooks"


apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
#pwd

if [[ ! -e $dir ]]; then
    mkdir $dir
fi
#mkdir ansible-playbooks
chown -R vagrant:vagrant ansible-playbooks
cp -a /home/vagrant/playbook.yml /home/vagrant/ansible-playbooks
#chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/ansible/hosts <<EOL
# vagrant environment nodes
[web]
web1 ansible_host=10.0.15.21
web2 ansible_host=10.0.15.22
web3 ansible_host=10.0.15.23
web4 ansible_host=10.0.15.24
web5 ansible_host=10.0.15.25
EOL
