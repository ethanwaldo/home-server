# Raspberry Pi Home Server & Agentic AI Environment

A home lab setup featuring a **Raspberry Pi 5** as a secure gateway and management hub, integrated with a **Windows desktop (WSL2)** backend for local AI model inference and development.

## Project Overview

This project establishes a modern, secure, and flexible home server infrastructure with the following key objectives:

- **Secure Remote Access**: Deploy a self-hosted VPN overlay network using Headscale and Tailscale for encrypted access to all services
- **Public Web Presence**: Host a personal portfolio website at `https://ethanwaldo.dev` with automatic HTTPS
- **Centralized Management**: Provide a unified, VPN-protected admin panel for monitoring and managing all server components
- **Agentic AI Workflow**: Enable seamless integration between local development tools and AI models running on high-performance hardware
- **Security-First Design**: Implement defense-in-depth security practices across all layers

This setup demonstrates practical applications of Linux system administration, containerized service deployment, network security, and modern DevOps practices.

## Architecture & Technology Stack

### Hardware
- **Primary Gateway**: Raspberry Pi 5 (8GB RAM)
- **AI Backend**: Windows Desktop with WSL2 (AMD GPU acceleration)

### Core Infrastructure
- **Operating System**: Ubuntu Server LTS
- **Containerization**: Docker & Docker Compose
- **Reverse Proxy**: Caddy v2 (automatic HTTPS via Let's Encrypt)
- **Dynamic DNS**: ddclient (automated domain updates)

### Network & Security
- **VPN Solution**: Self-hosted Headscale server (`https://hs.ethanwaldo.dev`)
- **Overlay Network**: Tailscale mesh network for all devices
- **Security**: SSH key authentication, UFW firewall, Fail2Ban intrusion prevention

### Management & Monitoring
**Admin Panel** (`https://admin.ethanwaldo.dev` - VPN access only):
- **System Management**: Webmin (`/webmin/`)
- **Container Orchestration**: Portainer (`/portainer/`)
- **AI Interface**: Open Web UI (`/ollama/`)
- **Landing Dashboard**: Custom overview page

## Service Endpoints

| Service | URL | Access | Purpose |
|---------|-----|--------|---------|
| Portfolio | `https://ethanwaldo.dev` | Public | Personal website |
| Headscale | `https://hs.ethanwaldo.dev` | Public API | VPN control server |
| Admin Panel | `https://admin.ethanwaldo.dev` | VPN Only | Management dashboard |

## Repository Structure

```
~/server/
├── README.md                 # This documentation
├── ROADMAP.md               # Development phases and goals
├── docker/
│   ├── compose.yaml         # Main service definitions
│   ├── .env.example         # Environment template
│   └── config/
│       ├── caddy/
│       │   └── Caddyfile    # Reverse proxy configuration
│       ├── ddclient/
│       │   └── ddclient.conf # DDNS configuration
│       └── headscale/
│           └── config.yaml  # VPN server configuration
└── system_configs/          # OS-level configuration templates
```

> **Note**: Web content has been moved to a separate repository for better organization.

## Key Features

### 🔒 Security-First Architecture
- All administrative access requires VPN connection
- SSH key-only authentication with Fail2Ban protection
- Automated security updates via unattended-upgrades
- Defense-in-depth network segmentation

### 🌐 Automatic HTTPS & DNS
- Let's Encrypt certificate automation via Caddy
- Dynamic DNS updates maintain connectivity despite ISP changes
- Clean subdomain organization for all services

### 🐳 Containerized Services
- All services run in isolated Docker containers
- Infrastructure-as-Code with Docker Compose
- Easy backup and migration of persistent data

### ⚡ Wake-on-LAN Integration
- Remote desktop wake capability from Raspberry Pi
- Seamless integration between low-power gateway and high-performance backend

## Getting Started

1. **Clone Repository**
   ```bash
   git clone <repository-url> ~/server
   cd ~/server
   ```

2. **Configure Environment**
   ```bash
   cp docker/.env.example docker/.env
   # Edit .env with your domain and credentials
   ```

3. **Deploy Services**
   ```bash
   cd docker
   docker compose up -d
   ```

4. **Join VPN Network**
   - Install Tailscale on your devices
   - Configure to use your Headscale server
   - Access admin panel via VPN

## Development Workflow

The agentic AI workflow enables:
- **Local Development**: Use Zed/Cursor on laptop with SSH remote development
- **AI Integration**: Local models running on desktop GPU with network access
- **Hybrid Intelligence**: Automatic switching between local and cloud AI based on task complexity

## Monitoring & Observability

Future monitoring stack will include:
- **Metrics Collection**: Prometheus + cAdvisor
- **Log Aggregation**: Loki + Promtail
- **Visualization**: Grafana dashboards
- **Alerting**: Custom alert rules for system health

## Contributing

This is a personal project documenting my home lab setup. Feel free to use these configurations as inspiration for your own infrastructure projects.

## Security Notice

This repository contains sanitized configuration files with sensitive data removed. Never commit secrets, API keys, or certificates to version control.

---

**Project Status**: Phase 1 Complete - Core infrastructure operational
**Next Phase**: AI backend deployment and monitoring integration
