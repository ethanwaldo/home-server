# Project Roadmap & Tickets

This document contains the detailed project roadmap broken down into manageable tickets for development and tracking.

## Overview

The project is organized into 4 main phases with 25 total tickets. Each ticket includes specific tasks, and acceptance criteria to enable clear progress tracking.

## Current Status

- **Active Phase**: Phase 1 (AI Integration)
- **Current Sprint**: Sprint 1 - AI Foundation
- **Next Milestone**: Working Ollama integration with admin panel

---

## Phase 1: AI Integration & Development Workflow

### 🎯 AI-001: Deploy Ollama on Desktop WSL
**Status**: 🚧 In Progress | **Priority**: High

**Description**: Set up Ollama with AMD GPU acceleration on Windows desktop WSL2

**Tasks**:
- [ ] Install Ollama in WSL2 environment
- [ ] Configure AMD GPU passthrough/acceleration
- [ ] Test basic model loading and inference
- [ ] Document installation process

**Acceptance Criteria**: Ollama runs with GPU acceleration and can load/run models

---

### 🎯 AI-002: Integrate Ollama with Admin Panel
**Status**: 📋 Planned | **Priority**: High

**Description**: Add Ollama service to Docker Compose and admin dashboard

**Tasks**:
- [ ] Add Ollama service configuration to compose.yaml
- [ ] Update Caddyfile for `/ollama/` reverse proxy
- [ ] Add Ollama link to admin dashboard
- [ ] Test connectivity through VPN

**Dependencies**: AI-001
**Acceptance Criteria**: Ollama accessible via admin panel at `/ollama/` path

---

### 🎯 AI-003: Set Up Open Web UI
**Status**: 📋 Planned | **Priority**: High

**Description**: Deploy Open Web UI as chat interface for local AI models

**Tasks**:
- [ ] Add Open Web UI container to Docker Compose
- [ ] Configure connection to Ollama backend
- [ ] Set up authentication/access controls
- [ ] Update admin dashboard with link

**Dependencies**: AI-002
**Acceptance Criteria**: Web-based chat interface working with local models

---

### 🎯 AI-004: Implement Agentic Coding Workflow
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Configure development environment for AI-assisted coding

**Tasks**:
- [ ] Set up Zed/Cursor IDE with local LLM integration
- [ ] Configure remote development workflow via SSH
- [ ] Create coding assistant prompts/templates
- [ ] Document workflow for future use

**Dependencies**: AI-003
**Acceptance Criteria**: Can code remotely with AI assistance through local models

---

### 🎯 AI-005: Add Raspberry Pi AI HAT
**Status**: 📋 Planned | **Priority**: Low

**Description**: Install and configure AI HAT for edge AI tasks

**Tasks**:
- [ ] Purchase and install Raspberry Pi AI HAT
- [ ] Install required drivers and software
- [ ] Test edge AI workloads
- [ ] Compare performance with desktop setup

**Dependencies**: AI-003
**Acceptance Criteria**: Pi can run AI models locally for edge computing tasks

---

### 🎯 AI-006: Build AI-Assisted Portfolio Website
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Enhance portfolio with AI-powered features

**Tasks**:
- [ ] Design AI-enhanced portfolio features
- [ ] Implement dynamic content generation
- [ ] Add interactive AI chat widget
- [ ] Deploy and test new portfolio

**Dependencies**: AI-003
**Acceptance Criteria**: Portfolio includes working AI features

---

## Phase 2: Monitoring & Observability

### 📊 MON-001: Deploy Prometheus
**Status**: 📋 Planned | **Priority**: High

**Description**: Set up Prometheus for metrics collection

**Tasks**:
- [ ] Add Prometheus container to Docker Compose
- [ ] Configure basic system metrics collection
- [ ] Set up service discovery for Docker containers
- [ ] Configure data retention policies

**Acceptance Criteria**: Prometheus collecting basic system and container metrics

---

### 📊 MON-002: Deploy Grafana
**Status**: 📋 Planned | **Priority**: High

**Description**: Set up Grafana for metrics visualization

**Tasks**:
- [ ] Add Grafana container to Docker Compose
- [ ] Configure Prometheus as data source
- [ ] Import basic dashboard templates
- [ ] Set up admin access through VPN

**Dependencies**: MON-001
**Acceptance Criteria**: Grafana accessible with basic system dashboards

---

### 📊 MON-003: Add cAdvisor for Container Metrics
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Deploy cAdvisor for detailed container monitoring

**Tasks**:
- [ ] Add cAdvisor container to Docker Compose
- [ ] Configure Docker socket access
- [ ] Update Prometheus to scrape cAdvisor metrics
- [ ] Create container-specific Grafana dashboards

**Dependencies**: MON-002
**Acceptance Criteria**: Detailed container metrics visible in Grafana

---

### 📊 MON-004: Deploy Loki for Log Aggregation
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Set up Loki for centralized log management

**Tasks**:
- [ ] Add Loki container to Docker Compose
- [ ] Configure log retention and storage
- [ ] Set up Grafana Loki data source
- [ ] Test basic log queries

**Dependencies**: MON-002
**Acceptance Criteria**: Loki collecting and storing container logs

---

### 📊 MON-005: Deploy Promtail for Log Collection
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Set up Promtail to ship logs to Loki

**Tasks**:
- [ ] Add Promtail container to Docker Compose
- [ ] Configure log file discovery and parsing
- [ ] Set up log labels and metadata
- [ ] Test log shipping to Loki

**Dependencies**: MON-004
**Acceptance Criteria**: System and container logs flowing to Loki

---

### 📊 MON-006: Create Comprehensive Health Dashboards
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Build unified monitoring dashboards

**Tasks**:
- [ ] Design comprehensive system health dashboard
- [ ] Create service-specific monitoring panels
- [ ] Set up alerting rules for critical metrics
- [ ] Document dashboard usage

**Dependencies**: MON-003, MON-005
**Acceptance Criteria**: Complete monitoring solution with alerts

---

## Phase 3: Hardware Improvements

### 🔧 HW-001: Install NVMe HAT
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Add NVMe storage for better Pi performance

**Tasks**:
- [ ] Purchase compatible NVMe HAT and SSD
- [ ] Install hardware components
- [ ] Configure OS to use NVMe storage
- [ ] Migrate system/data to faster storage

**Acceptance Criteria**: Pi running on NVMe with improved performance

---

### 🔧 HW-002: Add UPS for Power Protection
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Install UPS for power redundancy

**Tasks**:
- [ ] Research and purchase appropriate UPS
- [ ] Install UPS monitoring software
- [ ] Configure graceful shutdown procedures
- [ ] Test power failure scenarios

**Acceptance Criteria**: Server survives power outages gracefully

---

### 🔧 HW-003: Implement Quiet Cooling Solution
**Status**: 📋 Planned | **Priority**: Low

**Description**: Upgrade cooling for quieter operation

**Tasks**:
- [ ] Research quiet cooling options for Pi 5
- [ ] Install new cooling solution
- [ ] Monitor temperatures under load
- [ ] Document thermal performance

**Acceptance Criteria**: Reduced noise with adequate cooling

---

## Phase 4: Additional Services

### 🚀 SVC-001: Implement Automated Backup System
**Status**: 📋 Planned | **Priority**: High

**Description**: Set up automated backups using rsync/borgbackup

**Tasks**:
- [ ] Choose backup solution (rsync vs borgbackup)
- [ ] Configure backup destinations and schedules
- [ ] Set up backup monitoring and alerts
- [ ] Test backup and restore procedures

**Acceptance Criteria**: Automated, monitored backup system

---

### 🚀 SVC-002: Deploy Game Servers
**Status**: 📋 Planned | **Priority**: Low

**Description**: Host game servers (Minecraft, etc.)

**Tasks**:
- [ ] Research game server requirements
- [ ] Add game server containers to compose
- [ ] Configure networking and access controls
- [ ] Set up game-specific monitoring

**Acceptance Criteria**: Stable game servers accessible to friends

---

### 🚀 SVC-003: Add NAS Functionality
**Status**: 📋 Planned | **Priority**: Medium

**Description**: Implement network-attached storage

**Tasks**:
- [ ] Add external storage capacity
- [ ] Set up Samba/NFS shares
- [ ] Configure user access controls
- [ ] Integrate with backup system

**Dependencies**: SVC-001
**Acceptance Criteria**: Network file storage accessible to devices

---

### 🚀 SVC-004: Home Automation Integration
**Status**: 📋 Planned | **Priority**: Low

**Description**: Connect with home automation systems

**Tasks**:
- [ ] Research home automation platforms
- [ ] Set up Home Assistant or similar
- [ ] Configure device integrations
- [ ] Create automation rules

**Acceptance Criteria**: Basic home automation capabilities

---

## Sprint Planning

### Sprint 1: AI Foundation (2 weeks) - **Current**
- **Goal**: Get basic AI integration working
- **Tickets**: AI-001, AI-002, AI-003
- **Outcome**: Working Ollama with web interface accessible via admin panel

### Sprint 2: Monitoring Foundation (2 weeks)
- **Goal**: Basic monitoring infrastructure
- **Tickets**: MON-001, MON-002, MON-003
- **Outcome**: Grafana dashboards showing system health

### Sprint 3: Complete Observability (2 weeks)
- **Goal**: Full logging and monitoring stack
- **Tickets**: MON-004, MON-005, MON-006
- **Outcome**: Complete monitoring solution with logs and alerts

### Sprint 4: AI Enhancement (2 weeks)
- **Goal**: Advanced AI features and workflow
- **Tickets**: AI-004, AI-006
- **Outcome**: Production AI-assisted development environment

### Sprint 5: Infrastructure Hardening (2 weeks)
- **Goal**: Reliability and performance improvements
- **Tickets**: SVC-001, HW-001, HW-002
- **Outcome**: Robust, backed-up system with better performance

---

## Ticket Status Legend

- 🚧 **In Progress**: Currently being worked on
- 📋 **Planned**: Ready to start, dependencies met
- ⏳ **Blocked**: Waiting on dependencies or external factors
- ✅ **Complete**: Finished and validated
- 🔄 **Review**: Completed, needs testing/validation

## Notes

- **Dependencies** must be completed before starting dependent tickets
- **Acceptance criteria** define clear completion requirements
- Consider creating GitHub Issues for each ticket to enable better tracking
- Update this document as tickets are completed or requirements change
