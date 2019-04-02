#!/bin/bash

useradd -m -d /home/ansible -s /bin/bash ansible
cat >> /etc/sudoers <<EOL
ansible ALL=(ALL:ALL) ALL
ansible ALL=(ALL) NOPASSWD:ALL
EOL
apt-get update
