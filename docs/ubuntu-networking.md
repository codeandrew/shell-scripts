# Networking Stuff

## UFW 

NAT (Network Address Translation) rules and firewall filtering rules used by UFW (Uncomplicated Firewall) on a Linux system. 
They govern how incoming, outgoing, and forwarded packets are handled.

Here's a breakdown of some of the essential parts:

1. **NAT Table Rules**: These rules handle the transformation of source addresses for packets leaving the network. The `-A POSTROUTING -s [source IP range] -o eth0 -j MASQUERADE` rules are used to hide internal IP addresses from external networks.
2. **Filter Table Rules**: This section contains the filtering rules, which dictate how packets are accepted, rejected, or dropped based on their attributes.
3. **Commit Lines**: Lines with `COMMIT` are essential as they signify the end of a rule section. Without them, the rules won't be processed.
4. **Connection Tracking**: Lines containing `-m conntrack --ctstate RELATED,ESTABLISHED` allow packets related to already established connections.
5. **ICMP, DHCP, and Multicast Rules**: These rules allow certain types of Internet Control Message Protocol (ICMP) packets, DHCP traffic, and Multicast traffic, which are typically necessary for normal network operation.
6. **Local, Broadcast, and Multicast Handling**: The `ufw-not-local` rules handle packets that are not local, multicast, or broadcast. Non-local packets are dropped, while specific multicast rules are allowed.
If you want to add a route to the accepted IPs, you can include the desired IP range in the appropriate section. For example, if you want to allow all traffic from `10.10.11.128/28`, you could add the following line in the `filter` section:

```bash
-A ufw-before-input -s 10.10.10.101/28 -j ACCEPT
```

This rule would allow all incoming traffic from the specified IP range. Make sure to insert this line in the appropriate place, such as after the other ACCEPT rules for specific traffic types, but before any broad DROP or REJECT rules.

Remember to reload your firewall after making any changes:

```bash
sudo ufw reload
```

Make sure to test these changes carefully, ideally in a non-production environment first, to ensure they behave as intended.
