# Raspberry Pi Home Server & Agentic Coding Environment

## Overview

This repository documents my personal home server and development environment built around a **Raspberry Pi 5** serving as a secure gateway and management hub, with my **Windows desktop (WSL2)** providing backend compute for local AI models.

### Project Goals

- **Secure Remote Access**: Establish a modern overlay network using Headscale and Tailscale
- **Web Hosting**: Host my portfolio at `https://ethanwaldo.dev`
- **Centralized Management**: Unified VPN-only admin panel for all server components
- **Agentic Development**: Enable remote coding workflows with local AI models
- **Security-First**: Implement defense-in-depth security practices

This serves as a practical implementation of Linux administration, containerization, networking, and security hardening.

## Project Status & Roadmap

📋 **See [ROADMAP.md](ROADMAP.md) for detailed project tickets and sprint planning**

### Current Phase: AI Integration
- 🚧 **In Progress**: Ollama deployment with GPU acceleration
- 🎯 **Next**: Admin panel integration and Open Web UI setup
- 📊 **Progress**: 6 tickets planned across 4 development phases

### Quick Status
- ✅ **Core Infrastructure**: Pi setup, Docker, Caddy, Headscale
- 🚧 **AI Integration**: In development (Phase 1)
- 📋 **Monitoring**: Planned (Phase 2)
- 📋 **Hardware Upgrades**: Planned (Phase 3)

## Architecture

### Hardware
- **Primary**: Raspberry Pi 5 (8GB RAM)
- **Compute Backend**: Windows 11 Desktop with WSL2
- **OS**: Ubuntu Server LTS on Pi

### Core Services

#### Secure Networking
- **Headscale**: Self-hosted Tailscale control server
  - Endpoint: `https://hs.ethanwaldo.dev`
  - Creates encrypted overlay network for all devices
  - Primary method for secure remote administration

#### Web Infrastructure
- **Caddy v2**: Reverse proxy and web server
  - Serves static portfolio at `https://ethanwaldo.dev`
  - Automatic HTTPS via Let's Encrypt
  - Proxies admin services and Headscale
- **ddclient**: Dynamic DNS updates for `ethanwaldo.dev`

#### Admin Panel (`https://admin.ethanwaldo.dev` - VPN Only)
| Service | Path | Purpose |
|---------|------|---------|
| Dashboard | `/` | Custom landing page with links to all tools |
| Webmin | `/webmin/` | Pi OS management interface |
| Portainer | `/portainer/` | Docker container management (Pi + desktop) |
| Headscale UI | `/headscale/` | VPN network management |
| Open Web UI | `/ollama/` | Chat interface for local AI models |

#### Development Workflow
- **Wake-on-LAN**: Pi can wake desktop via `wakeup` alias
- **WSL SSH**: OpenSSH server in WSL2 (auto-starts via Task Scheduler)
- **Connection Flow**: Headscale VPN → SSH to Pi → `connect` alias → WSL desktop

#### Security & Secrets
- **1Password**: Centralized secrets management for API keys and SSH passphrases
- **Environment Variables**: Docker secrets in gitignored `.env` file
- **Network Isolation**: Admin services only accessible via VPN

## Repository Structure

```
~/server/ (on Raspberry Pi)
├── README.md
├── ROADMAP.md                   # Detailed project tickets and planning
├── .gitignore
├── docker/
│   ├── compose.yaml              # Main Docker Compose configuration
│   ├── .env.example             # Template for environment variables
│   └── config/
│       ├── caddy/
│       │   └── Caddyfile        # Reverse proxy configuration
│       ├── ddclient/
│       │   └── ddclient.conf    # Dynamic DNS configuration
│       └── headscale/
│           └── config.yaml      # VPN server configuration
├── site/
│   ├── admin/
│   │   └── index.html          # Admin dashboard landing page
│   └── public/
│       └── index.html          # Portfolio website
└── system_configs/
    └── ...                     # System configuration templates
```

## Deployment Stack

All services run in Docker containers managed by Docker Compose:

- **caddy**: Web server and reverse proxy
- **headscale**: VPN control server
- **ddclient**: Dynamic DNS client
- **portainer**: Container management UI
- **webmin**: System administration UI

## Quick Start

1. **Clone and Configure**:
   ```bash
   git clone <repository-url> ~/server
   cd ~/server/docker
   cp .env.example .env
   # Edit .env with your configuration
   ```

2. **Deploy Services**:
   ```bash
   docker compose up -d
   ```

3. **Access Admin Panel**:
   - Connect to Headscale VPN
   - Navigate to `https://admin.ethanwaldo.dev`

## Development Workflow

For detailed development tickets and sprint planning, see [ROADMAP.md](ROADMAP.md).

### Contributing to This Project
1. Check the [ROADMAP.md](ROADMAP.md) for current tickets and priorities
2. Create a branch for your feature/ticket (e.g., `feature/AI-001-deploy-ollama`)
3. Reference ticket numbers in commit messages
4. Update ticket status when work is complete

## Security Considerations

- **Network Segmentation**: Admin services isolated behind VPN
- **Automatic Updates**: Unattended upgrades enabled on Pi
- **Firewall**: UFW configured with minimal attack surface
- **TLS Everywhere**: All services use HTTPS via Let's Encrypt
- **Secrets Management**: No hardcoded credentials in repository

## Contributing

This is a personal project, but feel free to:
- Open issues for questions about the setup
- Submit PRs for documentation improvements
- Use this as inspiration for your own homelab

## License

This project is for educational purposes. Configuration files are provided as-is under MIT license.
