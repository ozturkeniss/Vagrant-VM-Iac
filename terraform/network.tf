# Network Infrastructure Configuration
# Local VM üzerinde network yapılandırması

# Network bilgileri
resource "local_file" "network_config" {
  filename = "${path.module}/network_config.txt"
  content  = <<-EOT
Network Infrastructure Configuration
===================================

Primary Network:
- Network: 192.168.56.0/24
- Gateway: 192.168.56.1
- Subnet Mask: 255.255.255.0
- Broadcast: 192.168.56.255

VM Network Configuration:
- VM IP: 192.168.56.10
- Hostname: terraform-ansible-vm
- DNS Servers: 8.8.8.8, 8.8.4.4

Port Configuration:
- SSH: 22 (VM) -> 2222 (Host)
- HTTP: 80 (VM) -> 80 (Host)
- HTTPS: 443 (VM) -> 443 (Host)

Network Services:
- DHCP: Disabled (Static IP)
- NAT: Enabled (VM -> Internet)
- Host-only: 192.168.56.0/24
EOT
}

# Firewall kuralları
resource "local_file" "firewall_rules" {
  filename = "${path.module}/firewall_rules.txt"
  content  = <<-EOT
Firewall Rules Configuration
============================

Inbound Rules:
- SSH (22): Allow from 192.168.56.0/24
- HTTP (80): Allow from any
- HTTPS (443): Allow from any
- ICMP: Allow ping from 192.168.56.0/24

Outbound Rules:
- All traffic: Allow to any
- DNS (53): Allow to 8.8.8.8, 8.8.4.4

Security Groups:
- Web Server: 80, 443, 22
- Database: 3306 (MySQL), 5432 (PostgreSQL)
- Monitoring: 9090 (Prometheus), 3000 (Grafana)
EOT
}

# Network monitoring konfigürasyonu
resource "local_file" "network_monitoring" {
  filename = "${path.module}/network_monitoring.txt"
  content  = <<-EOT
Network Monitoring Configuration
================================

Monitoring Tools:
- Netstat: Network connections
- Iftop: Network usage
- Nethogs: Process network usage
- Tcpdump: Packet capture

Alerting:
- High bandwidth usage: >100MB/s
- Connection failures: >5/min
- Latency threshold: >100ms

Logging:
- Network logs: /var/log/network/
- Connection logs: /var/log/connections.log
- Error logs: /var/log/network-errors.log
EOT
}

# Network output'ları
output "network_info" {
  description = "Network configuration information"
  value = {
    network_cidr = "192.168.56.0/24"
    vm_ip = "192.168.56.10"
    gateway = "192.168.56.1"
    dns_servers = ["8.8.8.8", "8.8.4.4"]
    ssh_port = "22 -> 2222"
    http_port = "80"
    https_port = "443"
  }
}
