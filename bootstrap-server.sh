#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)

#dir="ansible-playbooks"


apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)


#chown -R ansible:ansible ansible-playbooks
cp -a /home/vagrant/playbook.yml /home/ansible

chown -R ansible.ansible /home/ansible/playbook.yml

cp -r /home/vagrant/.ssh /home/ansible
chown -R ansible:ansible /home/ansible/.ssh

# configure hosts file for our internal network defined by Vagrantfile

cat >> /etc/ansible/hosts <<EOL

[web]
web1 ansible_host=10.0.15.21
web2 ansible_host=10.0.15.22
EOL
