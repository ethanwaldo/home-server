# Home Server Roadmap
*Tracking progress on my Raspberry Pi gateway + Windows desktop AI backend*

## Phase 1 — Core Infrastructure (✅ Complete)

### Raspberry Pi Gateway Setup
- [x] Ubuntu Server LTS with SSH hardening (key-only auth)
- [x] UFW + Fail2Ban security hardening
- [x] Docker + Docker Compose environment
- [x] `log2ram` + `unattended-upgrades` for reliability

### Networking & Domain
- [x] Domain registration (`ethanwaldo.dev`)
- [x] DDNS configuration with Porkbun API via `ddclient`
- [x] Headscale (self-hosted Tailscale) VPN mesh network
- [x] Caddy v2 reverse proxy with auto-HTTPS

### Service Architecture
- [x] Docker Compose orchestration for all Pi services
- [x] VPN-only access model (no public admin interfaces)
- [x] Portfolio website hosting at `https://ethanwaldo.dev`

---

## Phase 2 — Desktop AI Backend (🔄 In Progress)

### WSL2 Environment
- [x] WSL2 hardening and SSH server setup
- [x] Network integration with Headscale VPN
- [ ] Docker installation and GPU passthrough configuration

### Remote Management
- [x] Wake-on-LAN integration from Pi
- [x] SSH-based management workflow
- [ ] Docker context setup for remote container management

### Ollama Deployment
- [ ] Containerized Ollama with AMD GPU acceleration
- [ ] Model management (LLaMA, CodeLlama, others)
- [ ] API accessibility from development devices

---

## Phase 3 — Agentic Development Workflow

### Editor Integration
- [ ] Zed/Cursor editors with remote development capabilities
- [ ] SSH configuration and port forwarding setup

### Development Tools
- [ ] Local AI model access from laptop
- [ ] Docker context management for multi-host development

### Workflow Optimization
- [ ] Custom development scripts and aliases
- [ ] Project template with AI integration
- [ ] Documentation of development patterns

---

## Phase 4 — Monitoring & Observability

### Monitoring
- [ ] Prometheus + Grafana (minimal setup)
- [ ] System metrics (Pi + Desktop via VPN)
- [ ] Docker container monitoring
- [ ] Ollama performance metrics

### Alerting
- [ ] Critical system alerts (disk, memory, VPN connectivity)
- [ ] Service availability monitoring
- [ ] Desktop wake/sleep status tracking

### Logging
- [ ] Centralized logging with Loki + Promtail
- [ ] Security event correlation
- [ ] Performance trend analysis

---

## Phase 5 — Future Plans

### Hardware Enhancements
- [ ] NVMe HAT for Pi (faster storage)
- [ ] UPS integration with power monitoring
- [ ] Pi AI HAT for edge inference experiments

### Security Hardening
- [ ] Multi-factor authentication across services
- [ ] Intrusion detection system (IDS)
- [ ] Automated security auditing scripts
- [ ] Disaster recovery playbook

### Advanced AI Workflows
- [ ] Multi-model routing and load balancing
- [ ] Custom agent frameworks
- [ ] Automated code review and deployment pipelines
- [ ] Edge vs cloud inference comparison

---

## Architecture Principles

- **VPN-First:** All management over secure overlay network
- **Minimal Surface:** Pi runs only essential gateway services
- **Developer-Focused:** Optimize for coding workflow efficiency
- **Resource Efficient:** Desktop powers down when not needed
- **Security Hardened:** Defense in depth, least privilege access
