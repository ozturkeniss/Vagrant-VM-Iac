#!/bin/bash

echo "🚀 Deployment Başlatılıyor..."
echo "================================"

# VM'i başlat
echo "📦 VM başlatılıyor..."
vagrant up

# VM durumunu kontrol et
echo "🔍 VM durumu kontrol ediliyor..."
vagrant status

# Terraform'u uygula
echo "🏗️ Terraform uygulanıyor..."
cd terraform
terraform apply -auto-approve
cd ..

# Ansible playbook'u çalıştır
echo "⚙️ Ansible playbook çalıştırılıyor..."
cd ansible
ansible-playbook main.yml
cd ..

echo "🎉 Deployment tamamlandı!"
echo ""
echo "📋 Sonraki adımlar:"
echo "   vagrant ssh                    - VM'e bağlan"
echo "   curl http://192.168.56.10     - Web sayfasını test et"
echo "   docker ps                      - Docker container'ları listele"
echo "   systemctl status nginx         - Nginx durumunu kontrol et"
echo ""
echo "🌐 Web arayüzü: http://192.168.56.10"
