#!/bin/bash

# Script to check and install Aircrack-ng and other dependencies on a Linux-based machine.

echo "Starting setup for Aircrack-ng and dependencies..."

# Check if the user is root (necessary for installing packages)
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root (use sudo)."
    exit 1
fi

# Update the system
echo "Updating system packages..."
apt-get update -y
apt-get upgrade -y

# Check if aircrack-ng is already installed
if ! command -v aircrack-ng &> /dev/null; then
    echo "Aircrack-ng not found, installing..."
    apt-get install -y aircrack-ng
else
    echo "Aircrack-ng is already installed."
fi

# Check if airbase-ng (part of aircrack-ng) is installed
if ! command -v airbase-ng &> /dev/null; then
    echo "Airbase-ng not found, installing..."
    apt-get install -y aircrack-ng
else
    echo "Airbase-ng is already installed."
fi

# Check for other dependencies (if not already installed, they will be installed)
dependencies=("iw" "macchanger" "hostapd" "dnsmasq" "ethtool")

for dep in "${dependencies[@]}"; do
    if ! command -v "$dep" &> /dev/null; then
        echo "$dep not found, installing..."
        apt-get install -y "$dep"
    else
        echo "$dep is already installed."
    fi
done

# Install additional tools like airmon-ng if not already installed
if ! command -v airmon-ng &> /dev/null; then
    echo "Installing airmon-ng (part of aircrack-ng)..."
    apt-get install -y aircrack-ng
else
    echo "airmon-ng is already installed."
fi

# Check for Wireshark for packet analysis (optional but useful for monitoring)
if ! command -v wireshark &> /dev/null; then
    echo "Wireshark not found, installing..."
    apt-get install -y wireshark
else
    echo "Wireshark is already installed."
fi

# Set permissions for Wireshark (optional)
if ! groups | grep &>/dev/null '\bwireshark\b'; then
    echo "Adding user to Wireshark group for packet capture..."
    usermod -aG wireshark $(whoami)
    echo "You may need to log out and log back in for the group changes to take effect."
fi

# Check if NetworkManager is running (some systems may need to stop it for monitor mode)
if systemctl is-active --quiet NetworkManager; then
    echo "Stopping NetworkManager service to enable monitor mode..."
    systemctl stop NetworkManager
fi

echo "Setup completed. You are now ready to run the Evil Twin attack with Aircrack-ng and airbase-ng."
echo "Run 'sudo systemctl start NetworkManager' to restart NetworkManager when done with the attack."

# End of script

