#!/bin/bash
# A script to back up important host system configurations into the Git repo.
# Should be run from the examples directory (e.g., ~/server/examples).

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
# Define the target directory for backups (current directory)
BACKUP_DIR="."  # Renamed from system_configs

# Get the current user for ownership fixes
CURRENT_USER=$(whoami)

# --- Script Start ---
echo "Starting system configuration backup..."

# Verify the script is being run from the examples directory
if [ ! -d "../docker" ]; then
    echo "Error: The 'docker' directory was not found in parent directory."
    echo "Please run this script from the examples directory (e.g., ~/server/examples)."
    exit 1
fi

# Create backup directory structure if it doesn't exist
echo "    Ensuring backup directory structure exists..."
mkdir -p "$BACKUP_DIR/system/ssh/"
mkdir -p "$BACKUP_DIR/system/ufw/"
mkdir -p "$BACKUP_DIR/system/user/"

# --- File Backup Operations ---

# Back up the SSH Daemon configuration file.
echo "    Backing up /etc/ssh/sshd_config..."
sudo cp /etc/ssh/sshd_config "$BACKUP_DIR/system/ssh/"

# Back up the main UFW rules file.
echo "    Backing up /etc/ufw/user.rules..."
sudo cp /etc/ufw/user.rules "$BACKUP_DIR/system/ufw/"

# Back up the user's .bashrc file for aliases and environment settings.
echo "    Backing up ~/.bashrc..."
cp ~/.bashrc "$BACKUP_DIR/system/user/bashrc" # Renaming to remove the dot for clarity

# Back up the user's crontab for scheduled tasks.
echo "    Backing up user crontab..."
# The crontab -l command lists the cron jobs. We redirect errors to /dev/null
# in case the user has no cron jobs, which would otherwise produce an error.
crontab -l > "$BACKUP_DIR/system/user/crontab.txt" 2>/dev/null || echo "# No crontab for this user." > "$BACKUP_DIR/system/user/crontab.txt"

# --- Fix Ownership Issues ---
echo "    Fixing file ownership for Git compatibility..."
# Change ownership of all backed up files to the current user
sudo chown -R "$CURRENT_USER:$CURRENT_USER" "$BACKUP_DIR/"

# Make files readable by the user (in case they had restrictive permissions)
find "$BACKUP_DIR/system/" -type f -exec chmod 644 {} \; 2>/dev/null || true
# Make directories executable/searchable
find "$BACKUP_DIR/system/" -type d -exec chmod 755 {} \; 2>/dev/null || true

# --- Create Info File ---
echo "    Creating backup information file..."
cat > "$BACKUP_DIR/backup_info.txt" << EOF
# System Configuration Backup Information
# Generated on: $(date)
# Backup script version: 2.0
# Host: $(hostname)
# User: $CURRENT_USER

## Backed up files:
- /etc/ssh/sshd_config -> system/ssh/sshd_config
- /etc/ufw/user.rules -> system/ufw/user.rules
- ~/.bashrc -> system/user/bashrc
- User crontab -> system/user/crontab.txt

## Notes:
- All files have been made readable by the repository owner
- These are example configurations from a working system
- Sensitive information should be reviewed before committing
EOF

# --- Final Report ---
echo "Backup completed successfully!"
echo "Files have been copied to the '$BACKUP_DIR' directory."
echo "All files are now owned by '$CURRENT_USER' and ready for Git."

# Optional: Show what was backed up
echo ""
echo "Backup directory structure:"
find "$BACKUP_DIR" -type f | sort
