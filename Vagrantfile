# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Ubuntu 22.04 LTS kullanıyoruz
  config.vm.box = "ubuntu/jammy64"
  
  # VM ayarları
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
    vb.name = "terraform-ansible-vm"
  end
  
  # Network ayarları
  config.vm.network "private_network", ip: "192.168.56.10"
  
  # Hostname
  config.vm.hostname = "terraform-ansible-vm"
  
  # Sync folder - proje dosyalarını VM'e kopyala
  config.vm.synced_folder ".", "/vagrant"
  
  # Provision script - gerekli paketleri yükle
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y python3 python3-pip python3-venv
    apt-get install -y software-properties-common
    apt-get install -y wget unzip curl
    apt-get install -y openssh-server
    systemctl enable ssh
    systemctl start ssh
  SHELL
end
