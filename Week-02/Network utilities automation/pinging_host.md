##  1. What is Ping?
Ping is a simple network tool used to test if a device is reachable across a network (LAN or Internet).
It works by sending a small network message called an ICMP Echo Request to a target (like google.com or another device).
If the target is online and reachable, it responds with an ICMP Echo Reply.

##  Example:
ping google.com
You’ll see something like:  Reply from 142.250.205.46: bytes=32 time=23ms TTL=58


## 2. What is an ICMP Echo Request/Reply?
ICMP = Internet Control Message Protocol (used by ping)
Ping sends Echo Request packets
The target replies with Echo Reply
This tells you:
    The target is online
    The time taken to respond (in ms)
    The IP address of the target
    Packet loss or delay (if any)

## 3. Use Ping to Test Network Connectivity
➤ Example 1: Ping a website

ping google.com
This checks if you can reach Google’s servers.

➤ Example 2: Ping your Wi-Fi router

ping 172.16.10.87

This tells you if you’re connected properly to your home network.

➤ Example 3: Ping another device (like your phone)
First, find your phone’s IP (via phone settings), then:

ping 192.168.137.232