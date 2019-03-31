# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

config.vm.define "ansible_server" do |ansible_server|
  ansible_server.vm.box = "ubuntu/trusty64"
  ansible_server.vm.hostname = 'ansible.server'
  ansible_server.vm.network :private_network, ip: "10.0.15.10"
  #ansible_server.vm.network "forwarded_port", guest: 80, host: 8080
  #ansible_server.vm.synced_folder "./shared", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
  ansible_server.vm.synced_folder "./shared", "/home/vagrant", :mount_options => ["dmode=777", "fmode=666"]
  ansible_server.vm.provider "virtualbox" do |vb|
     vb.name = "ansible_server"
     vb.memory = "2024"
     vb.cpus = 2
  end
  ansible_server.vm.provision "shell", inline: <<-SHELL
     apt-get update
     echo "-----------------------"
   SHELL
   ansible_server.vm.provision "shell", path: "bootstrap-server.sh"
end
  # create some web servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html

  (1..2).each do |i|
    config.vm.define "web#{i}" do |client|
        client.vm.box = "ubuntu/trusty64"
        client.vm.hostname = "web#{i}"
        client.vm.network :private_network, ip: "10.0.15.2#{i}"
        client.vm.network "forwarded_port", guest: 80, host: "808#{i}"
        client.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    end
end

=begin
config.vm.define "ansible_client_1" do |ansible_client_1|
  ansible_client_1.vm.box = "ubuntu/trusty64"
  ansible_client_1.vm.hostname = 'client.1'
  ansible_client_1.vm.network "forwarded_port", guest: 90, host: 8989
  ansible_client_1.vm.synced_folder "./shared", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
  ansible_client_1.vm.provider "virtualbox" do |vb|
     vb.name = "ansible_client_1"
     vb.memory = "2024"
     vb.cpus = 2
  end
  ansible_client_1.vm.provision "shell", inline: <<-SHELL
     apt-get update
     echo "-----------------------"
     apt-get install -y nginx
     nginx -V
   SHELL
end

config.vm.define "ansible_client_2" do |ansible_client_2|
  ansible_client_2.vm.box = "ubuntu/trusty64"
  ansible_client_2.vm.hostname = 'client.2'
  ansible_client_2.vm.network "forwarded_port", guest: 800, host: 8000
  ansible_client_2.vm.synced_folder "./shared", "/var/www/html", :mount_options => ["dmode=777", "fmode=666"]
  ansible_client_2.vm.provider "virtualbox" do |vb|
     vb.name = "ansible_client_2"
     vb.memory = "2024"
     vb.cpus = 2
  end
  ansible_client_2.vm.provision "shell", inline: <<-SHELL
     apt-get update
     echo "-----------------------"
     apt-get install -y nginx
     nginx -V
   SHELL
end
=end

end
