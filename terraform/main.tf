terraform {
  required_version = ">= 1.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Local dosya sistemi provider'ı
provider "local" {}

# Null resource provider'ı
provider "null" {}

# VM bilgilerini local dosyaya yaz
resource "local_file" "vm_info" {
  filename = "${path.module}/vm_info.txt"
  content  = <<-EOT
VM Bilgileri:
- Hostname: terraform-ansible-vm
- IP: 192.168.56.10
- Memory: 2GB
- CPU: 2 cores
- OS: Ubuntu 22.04 LTS
- SSH Port: 22
EOT
}

# Ansible inventory dosyası oluştur
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = <<-EOT
[local_vms]
terraform-ansible-vm ansible_host=192.168.56.10 ansible_user=vagrant ansible_ssh_private_key_file=~/.vagrant.d/insecure_private_key

[local_vms:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOT
}

# Output değerleri outputs.tf dosyasında tanımlanmıştır
