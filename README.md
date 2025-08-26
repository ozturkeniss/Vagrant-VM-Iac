# Terraform + Ansible + Vagrant IaC Project

This project allows you to practice Infrastructure as Code (IaC) on a local VM without needing a cloud account. It creates VMs with Vagrant, manages infrastructure with Terraform, and handles configuration with Ansible.

## Architecture

<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/be7f5e63-8b2d-441a-8c27-74c3aa3ab6aa" />


## Requirements

- **Vagrant** (>= 2.3.0)
- **VirtualBox** (>= 6.1.0)
- **Terraform** (>= 1.0.0)
- **Ansible** (>= 2.12.0)

## Quick Start

### 1. Installation

```bash
# Make scripts executable
chmod +x scripts/setup.sh

# Start installation
./scripts/setup.sh
```

### 2. Deployment

```bash
# Make scripts executable
chmod +x scripts/deploy.sh

# Start deployment
./scripts/deploy.sh
```

### 3. Manual Steps

```bash
# Start VM
vagrant up

# Initialize Terraform
cd terraform
terraform init
terraform apply

# Run Ansible playbook
cd ../ansible
ansible-playbook main.yml
```

## Project Structure

```
vagrant-vm-iac/
├── Vagrantfile              # Vagrant configuration
├── terraform/               # Terraform files
│   ├── main.tf             # Main Terraform configuration
│   ├── variables.tf        # Variables
│   ├── outputs.tf          # Outputs
│   └── network.tf          # Network infrastructure
├── ansible/                 # Ansible files
│   ├── main.yml            # Main playbook
│   ├── network.yml         # Network infrastructure playbook
│   ├── inventory.ini       # Host inventory
│   ├── requirements.yml    # Collection requirements
│   └── ansible.cfg         # Ansible configuration
├── scripts/                 # Helper scripts
│   ├── setup.sh            # Setup script
│   └── deploy.sh           # Deployment script
└── README.md               # This file
```

## Usage

### Vagrant Commands

```bash
vagrant up          # Start VM
vagrant status      # Show VM status
vagrant ssh         # SSH to VM
vagrant halt        # Stop VM
vagrant destroy     # Delete VM
```

### Terraform Commands

```bash
cd terraform
terraform init      # Initialize Terraform
terraform plan      # Show plan
terraform apply     # Apply changes
terraform destroy   # Delete resources
```

### Ansible Commands

```bash
cd ansible
ansible-playbook main.yml                    # Run main playbook
ansible-playbook network.yml                 # Run network infrastructure
ansible-playbook main.yml --tags nginx       # Run only nginx tagged tasks
ansible all -m ping                          # Ping hosts
```

## Access

- **SSH**: `vagrant@192.168.56.10`
- **Web**: http://192.168.56.10
- **Network Status**: http://192.168.56.10/network-status.html
- **Vagrant SSH**: `vagrant ssh`

## Installed Services

- **Nginx** - Web server
- **Docker** - Container engine
- **Python3** - Python interpreter
- **Git, Vim, Tree, Htop** - Helper tools

## Network Infrastructure

- **Network Monitoring Tools** - netstat, iftop, nethogs, tcpdump
- **Firewall (UFW)** - Security rules and port management
- **Performance Testing** - iperf3, nmap, network scripts
- **Monitoring Scripts** - Automated network monitoring
- **Log Management** - Network logs and connection tracking

## Ansible Tags

```bash
# Run only specific tasks
ansible-playbook main.yml --tags system,update    # System updates
ansible-playbook main.yml --tags packages,install # Package installation
ansible-playbook main.yml --tags nginx,config     # Nginx configuration
ansible-playbook main.yml --tags docker,service  # Docker services
ansible-playbook network.yml --tags network,tools # Network tools
ansible-playbook network.yml --tags firewall      # Firewall configuration
```

## Troubleshooting

### VM Won't Start
```bash
# Check VirtualBox
VBoxManage list vms

# Check Vagrant logs
vagrant up --debug
```

### Ansible Connection Error
```bash
# Check SSH key
ls -la ~/.vagrant.d/insecure_private_key

# Test inventory
ansible all -m ping
```

### Terraform Error
```bash
# Check Terraform state
terraform show

# Reinitialize Terraform
terraform init -reconfigure
```

## Learning Resources

- [Vagrant Documentation](https://www.vagrantup.com/docs)
- [Terraform Documentation](https://www.terraform.io/docs)
- [Ansible Documentation](https://docs.ansible.com/)

## Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## Support

If you encounter any issues:
1. Create an issue
2. Check the README.md
3. Review the troubleshooting section
