#!/bin/bash

# install_fail2ban.sh
# This script installs and configures Fail2Ban on Ubuntu and Kali Linux.

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display messages
function echo_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function echo_warn() {
    echo -e "\e[33m[WARNING]\e[0m $1"
}

function echo_error() {
    echo -e "\e[31m[ERROR]\e[0m $1"
}

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo_error "Please run this script with sudo or as root."
    exit 1
fi

echo_info "Updating package lists..."
apt update -y

# Check if Fail2Ban is already installed
if dpkg -l | grep -qw fail2ban; then
    echo_warn "Fail2Ban is already installed. Skipping installation."
else
    echo_info "Installing Fail2Ban..."
    apt install -y fail2ban
fi

# Ensure Fail2Ban service is enabled and started
echo_info "Enabling and starting Fail2Ban service..."
systemctl enable fail2ban
systemctl start fail2ban

# Backup existing jail.local if it exists
JAIL_LOCAL="/etc/fail2ban/jail.local"
if [ -f "$JAIL_LOCAL" ]; then
    echo_warn "$JAIL_LOCAL already exists. Creating a backup at $JAIL_LOCAL.bak."
    cp "$JAIL_LOCAL" "${JAIL_LOCAL}.bak"
fi

# Copy jail.conf to jail.local if jail.local does not exist
if [ ! -f "$JAIL_LOCAL" ]; then
    echo_info "Creating jail.local from jail.conf..."
    cp /etc/fail2ban/jail.conf "$JAIL_LOCAL"
fi

# Configure Fail2Ban settings
echo_info "Configuring Fail2Ban settings..."

# Use a temporary file to store the new configuration
TEMP_JAIL=$(mktemp)

# Modify bantime, findtime, and maxretry in [DEFAULT] section
sed '/^\[DEFAULT\]/,/^\[/{
    s/^bantime\s*=.*/bantime = 10m/
    s/^findtime\s*=.*/findtime = 10m/
    s/^maxretry\s*=.*/maxretry = 5/
}' "$JAIL_LOCAL" > "$TEMP_JAIL"

# Enable and configure SSH protection
sed '/^\[sshd\]/,/^\[/{
    s/^enabled\s*=.*/enabled = true/
    s/^port\s*=.*/port = ssh/
    s|^logpath\s*=.*|logpath = /var/log/auth.log|
    s/^backend\s*=.*/backend = systemd/
}' "$TEMP_JAIL" > "${TEMP_JAIL}.tmp" && mv "${TEMP_JAIL}.tmp" "$TEMP_JAIL"

# Replace the original jail.local with the updated configuration
mv "$TEMP_JAIL" "$JAIL_LOCAL"

# Restart Fail2Ban to apply changes
echo_info "Restarting Fail2Ban service..."
systemctl restart fail2ban

# Display Fail2Ban status
echo_info "Fail2Ban installation and configuration completed successfully."
echo_info "Current Fail2Ban status:"
fail2ban-client status

# Optional: Display status of SSH jail
echo_info "SSH Jail Status:"
fail2ban-client status sshd

# Cleanup temporary files
rm -f "$TEMP_JAIL"

exit 0
