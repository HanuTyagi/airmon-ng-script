# Wi-Fi Attack & Defense Simulator

## Overview

This project simulates common **Wi-Fi attacks** and demonstrates **defense strategies**. It provides an educational lab environment for understanding Wi-Fi security by simulating attacks like **Evil Twin** and **Deauthentication (Deauth)** attacks. The project also includes defense strategies such as using **WPA3** encryption and **802.11w** management frame protection to secure networks against these attacks.

### **Goal:**
- Demonstrate Wi-Fi attacks (Evil Twin, Deauth).
- Teach how to defend against these attacks.

### **Tools Used:**
- **Aircrack-ng**: A suite of tools for Wi-Fi network penetration testing.
- **Wireshark**: A network protocol analyzer for monitoring network traffic.
- **Kali Linux**: A Linux distribution used for penetration testing.

### **Project Components:**
1. **Attacker Module**: Scripts to simulate Evil Twin and Deauth attacks.
2. **Defense Strategies**: Explanation and scripts for defending against Wi-Fi attacks (WPA3, 802.11w).
3. **Lab Simulator GUI** (planned): A graphical interface to simulate attacks and defenses.
4. **Reporting**: Collecting results of the simulated attacks and defenses.

## Features
- **Evil Twin Attack**: Create a fake AP that mimics a legitimate Wi-Fi network and captures user credentials.
- **Deauthentication Attack**: Disconnect a victim from a legitimate AP by sending deauth packets.
- **Scanning**: Scan for nearby Wi-Fi networks to analyze and target.
- **Defense Strategies**: Learn about WPA3 encryption and 802.11w protection to defend against attacks.
- **Interactive Menu**: Easy-to-follow interactive CLI menu for launching attacks or scanning networks.

## Requirements

- **Kali Linux** or another Linux-based distribution.
- A wireless adapter that supports monitor mode and packet injection (e.g., Alfa AWUS036NHA).
- **Wireshark** (optional for packet analysis).

### Tools Installation:
1. **Aircrack-ng**: This suite includes all necessary tools like `airmon-ng`, `aireplay-ng`, `airodump-ng`, and `airbase-ng`.
2. **Wireshark**: For monitoring network traffic and analyzing attack packets.
3. **Kali Linux**: Recommended environment for this simulation lab.

## Setup Instructions

### 1. **Clone the Repository**:
   To clone this repository to your machine, run:
   ```bash
   git clone https://github.com/your-username/Wi-Fi-Attack-Defense-Simulator.git
   cd Wi-Fi-Attack-Defense-Simulator
