# Home Server Roadmap
_Tracking progress on my Raspberry Pi + AI dev setup_

## Phase 1 — Infrastructure (✓ Complete)
Set up a secure and reliable base system.

### Setup & Security
- [x] Flash Ubuntu Server LTS, enable SSH
- [x] Create user, set timezone/locale
- [x] Harden SSH (key auth, custom port, disable password)
- [x] Install UFW + Fail2Ban

### Networking
- [x] Registered domain (`ethanwaldo.dev`)
- [x] Configured DNS + DDNS via `ddclient`
- [x] Setup VPN mesh with Headscale + Tailscale

### Reverse Proxy
- [x] Deployed Caddy with auto HTTPS
- [x] Added reverse proxy rules and admin subdomains

### Admin Tools
- [x] Installed Webmin, Portainer
- [x] Created VPN-only dashboard access

### Reliability
- [x] Set up `log2ram`, unattended upgrades
- [x] Monitoring basics + SD card wear mitigation

---

## Phase 2 — AI Backend + Monitoring (⧗ In Progress)
Add model serving and basic observability.

### AI Backend (Ollama)
- [ ] Docker + GPU passthrough on desktop
- [ ] Deploy Ollama with LLaMA 3 + CodeLlama
- [ ] Wake-on-LAN from Pi
- [ ] Connect Web UI → Ollama

### Monitoring Stack
- [ ] Add Prometheus + Grafana
- [ ] cAdvisor and node metrics
- [ ] Loki + Promtail for logs

### Dashboards
- [ ] System health + container views
- [ ] Ollama performance, GPU metrics
- [ ] Alerts for uptime, VPN, network

---

## Phase 3 — Dev Workflow & Agents (⏳ Planned)
Build a smooth coding setup with local LLM support.

### Remote Dev
- [ ] Zed + Cursor setup
- [ ] SSH config and port forwarding
- [ ] Local dev accessing remote Ollama API

### Agent Framework
- [ ] Python agent skeleton
- [ ] LLM routing + context memory
- [ ] Basic tool usage, workflow automation

---

## Phase 4 — Expansion & Hardening (🔒 Planned)
Scale hardware and lock things down.

### Hardware Upgrades
- [ ] NVMe HAT for Pi
- [ ] UPS + power alerts

### Security
- [ ] MFA across services
- [ ] IDS, audit scripts, recovery playbooks

### Backup & Recovery
- [ ] Automate config + volume backups
- [ ] Full system recovery test

---

## Phase 5 — Portfolio + Edge AI (🚧 Concept)
Showcase the project and test edge inference.

### Portfolio
- [ ] Redesign with AI-generated content
- [ ] Host via Caddy

### Edge AI
- [ ] Install Pi AI HAT
- [ ] Run local models, compare with cloud

---

## Maintenance

**Daily**
- System health check
- Backup confirmation
- Security logs

**Weekly**
- Update containers & packages
- Review monitoring alerts

**Monthly**
- Recovery test
- Review roadmap
- Audit security settings

---

## Current Status
✅ Phase 1: Complete
⧗ Phase 2: In progress
🔜 Next: Deploy Ollama + Prometheus stack
