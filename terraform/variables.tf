# VM konfigürasyon değişkenleri
variable "vm_memory" {
  description = "VM memory in MB"
  type        = number
  default     = 2048
}

variable "vm_cpus" {
  description = "VM CPU count"
  type        = number
  default     = 2
}

variable "vm_ip" {
  description = "VM private network IP"
  type        = string
  default     = "192.168.56.10"
}

variable "vm_hostname" {
  description = "VM hostname"
  type        = string
  default     = "terraform-ansible-vm"
}

variable "vm_box" {
  description = "Vagrant box name"
  type        = string
  default     = "ubuntu/jammy64"
}

# Ansible değişkenleri
variable "ansible_user" {
  description = "SSH user for Ansible"
  type        = string
  default     = "vagrant"
}

variable "ansible_ssh_key" {
  description = "SSH private key path"
  type        = string
  default     = "~/.vagrant.d/insecure_private_key"
}
