#!/bin/bash

echo "🚀 Terraform + Ansible + Vagrant Projesi Kurulumu"
echo "=================================================="

# Gerekli paketleri kontrol et
echo "📦 Gerekli paketler kontrol ediliyor..."

# Vagrant kontrolü
if ! command -v vagrant &> /dev/null; then
    echo "❌ Vagrant bulunamadı. Lütfen önce Vagrant'ı yükleyin:"
    echo "   https://www.vagrantup.com/downloads"
    exit 1
fi

# VirtualBox kontrolü
if ! command -v VBoxManage &> /dev/null; then
    echo "❌ VirtualBox bulunamadı. Lütfen önce VirtualBox'ı yükleyin:"
    echo "   https://www.virtualbox.org/wiki/Downloads"
    exit 1
fi

# Terraform kontrolü
if ! command -v terraform &> /dev/null; then
    echo "❌ Terraform bulunamadı. Lütfen önce Terraform'u yükleyin:"
    echo "   https://developer.hashicorp.com/terraform/downloads"
    exit 1
fi

# Ansible kontrolü
if ! command -v ansible &> /dev/null; then
    echo "❌ Ansible bulunamadı. Lütfen önce Ansible'ı yükleyin:"
    echo "   sudo apt install ansible"
    exit 1
fi

echo "✅ Tüm gerekli paketler mevcut!"

# Terraform init
echo "🔧 Terraform başlatılıyor..."
cd terraform
terraform init
cd ..

# Ansible collections yükle
echo "📚 Ansible collections yükleniyor..."
cd ansible
ansible-galaxy collection install -r requirements.yml
cd ..

# Vagrant box'ı indir
echo "📦 Vagrant box indiriliyor..."
vagrant box add ubuntu/jammy64 --provider virtualbox

echo "🎉 Kurulum tamamlandı!"
echo ""
echo "📋 Kullanım komutları:"
echo "   vagrant up                    - VM'i başlat"
echo "   vagrant status                - VM durumunu göster"
echo "   vagrant ssh                   - VM'e SSH ile bağlan"
echo "   terraform plan                - Terraform planını göster"
echo "   terraform apply               - Terraform'u uygula"
echo "   ansible-playbook main.yml     - Ansible playbook'u çalıştır"
echo "   vagrant destroy               - VM'i sil"
echo ""
echo "🌐 Web arayüzü: http://192.168.56.10"
