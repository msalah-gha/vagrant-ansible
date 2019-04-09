#!/usr/bin/env bash
mkdir /home/ansible/.ssh
chown -R ansible:ansible /home/ansible/.ssh
cp  /home/vagrant/authorized_keys  /home/ansible/.ssh
