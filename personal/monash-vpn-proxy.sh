#!/bin/bash
# Connect to Monash Cisco VPN so only SSH goes over the VPN.
# Requires ocproxy.

# Old version.
#/usr/sbin/openconnect --no-cert-check -u marcus --script-tun --script "ocproxy -D 9052" vpn.monash.edu

# Newer versions. Remove --no-cert-check.
# /usr/sbin/openconnect -u marcus --script-tun --script "ocproxy -D 9052" vpn.monash.edu

# Automate. Adapted from https://askubuntu.com/questions/1043024/how-to-run-openconnect-with-username-and-password-in-a-line-in-the-terminal
password="PASSWORD"
challange=2
# Password only.
# echo "$password" | /usr/sbin/openconnect -u marcus --passwd-on-stdin --script-tun --script "ocproxy -D 9052" vpn.monash.edu
# FAIL
{ printf "$password\n"; sleep 1; printf "$challange\n"; } | /usr/sbin/openconnect -u marcus --passwd-on-stdin --script-tun --script "ocproxy -D 9052" vpn.monash.edu

# openconnect has default --reconnect-timeout 600 (seconds)
