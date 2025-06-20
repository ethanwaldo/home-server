# Raspberry Pi Home Server & Agentic Coding Environment

## About This Project

This repository documents the setup and configuration of my personal home server and development environment. The architecture uses a **Raspberry Pi 5** as a secure gateway, and my more powerful **Windows desktop (with WSL2)** as a backend for running local AI models.

The primary goals of this project are to:

* Establish a secure, modern, and flexible overlay network using **Headscale** for remote access to my desktop.
* Host my personal portfolio website at `https://ethanwaldo.dev` using **Caddy**.
* Enable a **Agentic Coding Workflow**, allowing me to use the **Zed/Cursor IDE** on my laptop to manage servers and interact with AI models running on my desktop.
* Manage all services directly and securely via developer tools like **SSH** and **Docker Contexts**, prioritizing a minimal and efficient setup.

This project serves as a practical application of skills in Linux system administration, Docker containerization, network configuration (DDNS, VPNs, Reverse Proxies), and security hardening.

## Core Architecture & Services

The entire system is orchestrated with Docker Compose on the Raspberry Pi. The Pi acts as the central control plane, while the desktop provides on-demand GPU resources for AI.

### On the Raspberry Pi (`ethan@pi`)

The Pi runs only the essential backbone services in a simple containerized setup.

* **Headscale (Self-Hosted Tailscale VPN):** Creates a private, encrypted overlay network for all my devices. The control server endpoint (`https://hs.ethanwaldo.dev`) allows my clients to connect from anywhere.
* **Caddy v2 (Web Server & Reverse Proxy):**
    * Serves my public portfolio website (which is maintained in a separate repository).
    * Acts as a secure reverse proxy for the Headscale API.
    * Automatically handles all HTTPS certificates via Let's Encrypt.
* **DDNS (`ddclient`):** Keeps my `ethanwaldo.dev` domain pointed to my home's dynamic public IP using the Porkbun API.
* **System Hardening & Management:**
    * **Management:** All system and container management is performed directly via a secure SSH connection and Docker Contexts from my development laptop.
    * **Security:** The system is hardened with UFW, Fail2Ban, key-only SSH authentication, and runs services with `unattended-upgrades` and `log2ram` for reliability.

### On the Windows Desktop (WSL2 - `ethan@wsl`)

The desktop acts as an on-demand headless server, woken remotely via Wake on LAN from the Pi.

* **Ollama (AI Model Server):** Will run in a Docker container inside WSL, configured to use the desktop's AMD GPU for acceleration and serve local LLMs.
* **SSH Server:** Allows my Pi (and me via the Pi) to connect securely for management.

## Repository Structure

This `home-server` repository contains the non-sensitive configuration files for the Raspberry Pi server infrastructure. My portfolio website is maintained in a separate repository.

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

-   **`README.md` / `ROADMAP.md`**: Project documentation.
-   **`.gitignore`**: Specifies files and directories to be excluded from version control (especially secrets).
-   **`docker/`**: Contains the `compose.yaml` file and all service configurations.
-   **`system_configs/`**: Contains backed-up host system configurations and the script (`backup.sh`) to populate it.

## Security & Secrets Management

-   **VPN-First Access:** All management is performed over the secure Tailscale overlay network.
-   **SSH Hardening:** The Pi's SSH server is configured for key-only authentication, with password authentication disabled.
-   **Secrets Management:** All sensitive credentials (API keys, SSH key passphrases) are stored securely in my **1Password** vault. They are deployed to the server via a gitignored `.env` file, with the required format documented in `.env.example`.
