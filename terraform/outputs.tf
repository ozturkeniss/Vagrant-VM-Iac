# VM bilgileri
output "vm_ip" {
  description = "VM private network IP address"
  value       = var.vm_ip
}

output "vm_hostname" {
  description = "VM hostname"
  value       = var.vm_hostname
}

output "ssh_command" {
  description = "SSH command to connect to VM"
  value       = "ssh ${var.ansible_user}@${var.vm_ip}"
}

output "vagrant_status" {
  description = "Vagrant status command"
  value       = "vagrant status"
}

output "vagrant_ssh" {
  description = "Vagrant SSH command"
  value       = "vagrant ssh"
}

# Ansible bilgileri
output "ansible_inventory_path" {
  description = "Path to Ansible inventory file"
  value       = "${path.module}/../ansible/inventory.ini"
}

output "ansible_playbook_path" {
  description = "Path to main Ansible playbook"
  value       = "${path.module}/../ansible/main.yml"
}
