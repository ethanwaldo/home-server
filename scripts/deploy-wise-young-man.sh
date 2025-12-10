#!/bin/bash
REPO_URL="https://github.com/EthanWaldo/wise-young-man.git"
DEPLOY_DIR="/opt/wise-young-man-deploy"
DOCKER_DIR="/home/waldo/server/docker"
LOG_FILE="/opt/wise-young-man-deploy/deployment.log"

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "Starting deployment check..."

# Navigate to deployment directory
cd "$DEPLOY_DIR"

# Check if repository exists, if not clone it
if [ ! -d ".git" ]; then
    log "Repository not found. Cloning from $REPO_URL..."
    git clone "$REPO_URL" .
    log "Repository cloned successfully."
fi

# Fetch latest changes from remote
log "Fetching latest changes..."
git fetch origin main

# Check if there are updates
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    log "Updates detected. Pulling changes..."
    git pull origin main
    
    log "Building and restarting wise-young-man container..."
    cd "$DOCKER_DIR"
    docker compose up -d --build wise-young-man
    
    log "Deployment completed successfully!"
else
    log "No updates found. Skipping deployment."
fi

log "Deployment check finished."
