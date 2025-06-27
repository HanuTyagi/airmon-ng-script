# Wi-Fi Attack Explanation

This document explains two common Wi-Fi attacks — **Evil Twin** and **Deauthentication (Deauth)** attacks — which are demonstrated in this Wi-Fi Attack & Defense Simulator project. Understanding these attacks is crucial for network security professionals, as they highlight vulnerabilities in Wi-Fi networks and the methods attackers use to exploit them.

## 1. **Evil Twin Attack**

### **What is the Evil Twin Attack?**
The **Evil Twin** attack involves an attacker setting up a fake Wi-Fi access point (AP) that mimics a legitimate network. This fake AP uses the same **SSID** (network name) as a target Wi-Fi network, tricking users into connecting to it. Once connected, the attacker can potentially intercept sensitive data, capture login credentials, or redirect the victim to phishing sites.

#### **How the Evil Twin Attack Works:**
1. **Setup**: The attacker uses tools like **Airbase-ng** to create a fake AP with the same SSID as the target network. The attacker can also configure the fake AP to have the same **security settings** (WPA, WPA2, etc.) as the target network to make it look identical.
   
2. **Deauthentication**: The attacker sends **deauthentication packets** to clients connected to the real access point. This forces victims to disconnect and search for available networks, making the fake AP appear as the best option. This process is often referred to as a **Denial of Service** (DoS) for the legitimate network.
   
3. **Connection**: Victims unknowingly connect to the fake AP, believing it to be the legitimate network.
   
4. **Data Capture**: Once connected, the attacker can monitor the network traffic using tools like **Wireshark** or **tcpdump**. Depending on the attacker's intentions, they could capture sensitive data like login credentials, perform man-in-the-middle attacks, or inject malicious packets into the victim's session.

#### **Impact of the Evil Twin Attack:**
- **Data Interception**: Any data sent over the network, including passwords, emails, or sensitive personal information, can be intercepted by the attacker.
- **Session Hijacking**: If the victim is logged into online services, the attacker can hijack their session, potentially gaining access to accounts.
- **Phishing**: The attacker could redirect the victim to fake websites to steal login credentials or other personal information.

#### **Defense Against Evil Twin Attack**:
- **Use WPA3 Encryption**: Modern encryption protocols like WPA3 make it harder for attackers to intercept data.
- **Verify Network Identity**: Users should verify the authenticity of networks before connecting, particularly in public spaces.
- **Use VPN**: Using a VPN (Virtual Private Network) encrypts all traffic between the victim and the internet, preventing attackers from capturing sensitive data.

### **Tools for the Evil Twin Attack:**
- **Airbase-ng**: Used to create a fake AP that mimics the target network.
- **Airodump-ng**: Used to scan and list nearby networks to identify the target for the Evil Twin attack.
- **Wireshark/tcpdump**: Packet capture tools used to analyze the network traffic between the victim and the attacker’s fake AP.

---

## 2. **Deauthentication (Deauth) Attack**

### **What is the Deauthentication Attack?**
The **Deauthentication attack** is a simple yet effective attack that disconnects a device from a Wi-Fi network. It works by sending **deauthentication frames** to a targeted device or network. These frames are part of the Wi-Fi management protocol and are typically used by the router to disconnect clients intentionally. However, in a deauthentication attack, the attacker sends these frames to disconnect devices from a legitimate network.

#### **How the Deauthentication Attack Works:**
1. **Target Selection**: The attacker uses tools like **Airodump-ng** to monitor nearby networks and identify the target (a specific device or access point).
   
2. **Frame Injection**: The attacker sends a **deauthentication frame** to the targeted device or access point. These frames are designed to disconnect the device from the network.
   
3. **Victim Disconnection**: Upon receiving the deauthentication frame, the victim’s device is disconnected from the network. The attacker can repeat the process multiple times to keep the device disconnected, causing a **Denial of Service** (DoS).
   
4. **Optional MITM (Man-in-the-Middle) Setup**: If the attacker also controls a fake AP (via an Evil Twin attack), the victim may automatically reconnect to the fake AP, allowing the attacker to intercept all communication between the victim and the network.

#### **Impact of the Deauthentication Attack:**
- **Network Downtime**: The victim’s device is disconnected from the Wi-Fi network, causing service disruption. This can be particularly impactful in enterprise environments.
- **DoS (Denial of Service)**: Continuous deauth frames can prevent users from accessing their own networks, disrupting legitimate use.
- **Facilitates Other Attacks**: This attack is often used as a precursor to other attacks. For example, after deauthenticating a victim, an attacker could launch an Evil Twin attack to impersonate the network and capture sensitive data.
   
#### **Defense Against Deauthentication Attack:**
- **WPA3 Encryption**: WPA3 helps protect against these types of attacks by adding management frame protection, which makes it harder for attackers to send spoofed deauthentication frames.
- **802.11w (Management Frame Protection)**: This security feature encrypts management frames, including deauthentication frames, making it harder for attackers to inject them into the network.
- **Monitor Network for Unusual Activity**: Intrusion Detection Systems (IDS) can be used to detect unusual deauthentication traffic and block these attacks in real-time.
- **Disable Automatic Reconnect**: Disabling automatic reconnection to a network can prevent devices from connecting to a fake AP after being deauthenticated.

### **Tools for the Deauthentication Attack:**
- **Aireplay-ng**: Used to send deauthentication frames to a target device or access point.
- **Airodump-ng**: Used to monitor nearby networks and identify the target for the Deauth attack.
- **Wireshark**: Can be used to monitor network traffic to detect the presence of deauthentication frames.

---

## 3. **Combined Use of Both Attacks**

The **Evil Twin** and **Deauthentication (Deauth)** attacks are often used together for a more effective attack. Here's how they complement each other:

1. **Deauthentication**: The attacker first sends deauthentication packets to disconnect a victim from their legitimate access point.
2. **Evil Twin**: After the victim is disconnected, the attacker sets up a fake AP with the same SSID as the legitimate network. The victim, believing the fake AP is the legitimate network, automatically reconnects to it, allowing the attacker to capture their data.

---

## Conclusion

Both the **Evil Twin** and **Deauthentication** attacks are effective methods of compromising Wi-Fi networks. While the **Deauth** attack is used to disrupt the network and disconnect users, the **Evil Twin** attack is used to impersonate a legitimate Wi-Fi network and capture sensitive data. Defending against these attacks requires proper encryption (such as WPA3), enabling management frame protection (802.11w), and using tools like VPNs to secure communications.

Understanding these attacks is crucial for securing Wi-Fi networks against malicious actors who attempt to exploit vulnerabilities. By using this Wi-Fi Attack & Defense Simulator, you can learn how these attacks work and how to implement defenses to protect your network.

