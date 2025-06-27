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
```

### 2. **Install Dependencies***:

Run the setup.sh script to install Aircrack-ng and other dependencies:

```
sudo ./setup.sh
```

### 3. **Run the Attack Simulation**:

You can run the Wi-Fi attack simulator by executing the aircrack-ng.sh script:

```
sudo ./aircrack-ng.sh
```

### 4. **Choose an Attack or Scan**:

The script will provide a menu with options for launching attacks or scanning nearby networks. You can:

    Create an Evil Twin to impersonate a target Wi-Fi.

    Perform a Deauthentication attack to disconnect a victim.

    Scan for nearby Wi-Fi networks for further analysis.

### 5. **Learn Defense Strategies**:

The project also includes documentation on defending against these attacks. Refer to the docs/defense-strategies.md for more information.

### Example Usage
1. **Evil Twin Attack**:

    Start the script and select the Evil Twin option.

    Select a Wi-Fi network to clone.

    The script will create a fake AP and begin capturing traffic.

2. **Deauthentication Attack**:

    Choose the Deauth option.

    Select a target Wi-Fi network.

    The script will continuously send deauthentication packets, disconnecting the victim.

3. **Scan Networks**:

    Choose the Scan for nearby Wi-Fi networks option to perform a new scan for available networks.

### How to Defend Against Wi-Fi Attacks
1. **Use WPA3**:

    WPA3 is the latest Wi-Fi security standard, providing stronger encryption and protection against attacks like Evil Twin.

2. **Enable 802.11w Management Frame Protection**:

    This feature protects against deauthentication attacks by securing management frames, which are typically vulnerable.


## Known Issues with Qualcomm Atheros QCA9377

### **Problem:**
If you're using a **Qualcomm Atheros QCA9377** Wi-Fi chipset, you might encounter issues when running the Wi-Fi attack simulator, particularly when trying to put your device into monitor mode or run tools like `airodump-ng` or `aireplay-ng`. 
The problem appears when using firmware-6.

### **Solution:**
To resolve this issue, uninstall the sixth version and download the version from GitHub.

Be sure to start by creating a backup (in case something goes wrong):
```	
cp -R /lib/firmware/ath10k/QCA9377 ~/
```

Remove the sixth version:
```
sudo rm /lib/firmware/ath10k/QCA9377/hw1.0/firmware-6.bin
```

For the changes to take effect, reboot:
```
reboot
```

Check with script or airodump-ng if it is workig.

If this did not help, or if the fifth version is missing in your distribution, then download the version from the github:
```	
sudo git clone https://github.com/ahmedmadder1/airodump-ng-not-showing-any-data-Atheros-QCA9377-.git
cd airodump-ng-not-showing-any-data-Atheros-QCA9377-
```

Remove the firmware (it is assumed that you have already made a backup as shown above):
```
sudo rm -rf /lib/firmware/ath10k/QCA9377
```

Copy the downloaded fifth version to the place where it should be on the system:
```
sudo cp -R QCA9377 /lib/firmware/ath10k/
```

For the changes to take effect, reboot:
```
reboot
```

### **Reference Documentation:**
- [Form](https://miloserdov.org/?p=5553)
- [Github](https://github.com/ahmedmadder1/airodump-ng-not-showing-any-data-Atheros-QCA9377-/)



### Contributing

Feel free to contribute by submitting issues, suggestions, or pull requests. Here's how you can contribute:

    Fork the repository.

    Clone your fork to your local machine.

    Create a new branch for your feature.

    Submit a pull request with your changes.

### License

This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

    Special thanks to the developers of Aircrack-ng and Wireshark for their incredible tools.

    This project is for educational purposes only and should not be used for malicious activities.
