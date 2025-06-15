#!/bin/bash
set -e

# Backup system configurations
# Run this script from the server root directory

# Ensure we're backing up to the system_configs directory
if [ ! -d "./system_configs" ]; then
    echo "Error: system_configs directory not found. Please run this script from the server root directory."
    exit 1
fi

BACKUP_DIR="./system_configs"
DATE=$(date '+%Y-%m-%d_%H-%M-%S')

echo "Starting system config backup at $(date)"
echo "Backup directory: $BACKUP_DIR"

# Create directories if they don't exist
mkdir -p "$BACKUP_DIR/etc/ssh"
mkdir -p "$BACKUP_DIR/etc/ufw"
mkdir -p "$BACKUP_DIR/home"

# Backup SSH configuration (remove sensitive keys)
echo "Backing up SSH config..."
if [ -f /etc/ssh/sshd_config ]; then
    sudo cp /etc/ssh/sshd_config "$BACKUP_DIR/etc/ssh/"
    echo "SSH daemon config backed up"
else
    echo "SSH daemon config not found"
fi

# Backup user SSH config if it exists
if [ -f ~/.ssh/config ]; then
    mkdir -p "$BACKUP_DIR/home/.ssh"
    cp ~/.ssh/config "$BACKUP_DIR/home/.ssh/"
    echo "User SSH config backed up"
fi

# Backup UFW rules
echo "Backing up UFW rules..."
if command -v ufw >/dev/null 2>&1; then
    ufw status numbered > "$BACKUP_DIR/etc/ufw/status.txt" 2>/dev/null || echo "UFW not active" > "$BACKUP_DIR/etc/ufw/status.txt"
    if [ -f /etc/ufw/user.rules ]; then
        sudo cp /etc/ufw/user.rules "$BACKUP_DIR/etc/ufw/" 2>/dev/null || echo "Could not backup user.rules (permission denied)"
    fi
    if [ -f /etc/ufw/user6.rules ]; then
        sudo cp /etc/ufw/user6.rules "$BACKUP_DIR/etc/ufw/" 2>/dev/null || echo "Could not backup user6.rules (permission denied)"
    fi
    echo "UFW rules backed up"
else
    echo "UFW not installed"
fi

# Backup bash configuration
echo "Backing up bash configs..."
if [ -f ~/.bashrc ]; then
    cp ~/.bashrc "$BACKUP_DIR/home/"
    echo ".bashrc backed up"
fi

if [ -f ~/.bash_aliases ]; then
    cp ~/.bash_aliases "$BACKUP_DIR/home/"
    echo ".bash_aliases backed up"
fi

if [ -f ~/.profile ]; then
    cp ~/.profile "$BACKUP_DIR/home/"
    echo ".profile backed up"
fi

# Backup cron jobs
echo "Backing up cron jobs..."
crontab -l > "$BACKUP_DIR/home/crontab.txt" 2>/dev/null || echo "No crontab for user" > "$BACKUP_DIR/home/crontab.txt"
echo "Crontab backed up"

# Backup custom systemd services only
echo "Checking for custom systemd services..."
CUSTOM_SERVICES_FOUND=false

# Look for services that are likely custom (not symlinks, not standard names)
if [ -d /etc/systemd/system ]; then
    mkdir -p "$BACKUP_DIR/etc/systemd"

    # Check for actual files (not symlinks) that might be custom
    find /etc/systemd/system -maxdepth 1 -name "*.service" -type f 2>/dev/null | while read -r service; do
        service_name=$(basename "$service")

        # Skip common system services
        case "$service_name" in
            systemd-*|dbus-*|getty@*|cloud-*|snap*|apparmor*|keyboard-*|setvtrgb*|syslog*|*resolved*|*timesyncd*|udisks*|vgauth*|vmtoolsd*|blk-*|finalrd*|iscsi*|lvm2-*|multipath*|log2ram*)
                continue
                ;;
            *)
                # This might be custom - back it up
                sudo cp "$service" "$BACKUP_DIR/etc/systemd/" 2>/dev/null || true
                echo "Potential custom systemd service backed up: $service_name"
                CUSTOM_SERVICES_FOUND=true
                ;;
        esac
    done

    if [ "$CUSTOM_SERVICES_FOUND" = false ]; then
        echo "No custom systemd services found"
        rmdir "$BACKUP_DIR/etc/systemd" 2>/dev/null || true
    fi
fi

# Create a backup info file
cat > "$BACKUP_DIR/backup_info.txt" << EOF
Backup created: $(date)
Hostname: $(hostname)
User: $(whoami)
Ubuntu version: $(lsb_release -d 2>/dev/null | cut -f2 || echo "Unknown")
Kernel: $(uname -r)
Docker version: $(docker --version 2>/dev/null || echo "Not installed")

Files backed up:
$(find "$BACKUP_DIR" -type f -name "*.conf" -o -name "*.config" -o -name "*.txt" -o -name "sshd_config" -o -name ".bashrc" -o -name ".bash_aliases" -o -name ".profile" | sort)
EOF

echo "Backup completed successfully at $(date)"
echo "Backup info saved to backup_info.txt"
echo ""
echo "Remember to review and commit changes to git if needed"
echo "Sensitive information may be present - check before committing"
