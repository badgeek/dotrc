#!/bin/bash

# IMPORTANT: You will need to disable SIP aka Rootless in order to fully execute this script, you can reenable it after.
# WARNING: It might disable things that you may not like. Please double check the services in the TODISABLE vars.

# Get active services: launchctl list | grep -v "\-\t0"
# Find a service: grep -lR [service] /System/Library/Launch* /Library/Launch* ~/Library/LaunchAgents

source services.sh

for agent in "${AGENTS[@]}"
do
    sudo mv /System/Library/LaunchAgents/${agent}.plist.bak /System/Library/LaunchAgents/${agent}.plist
    {
        sudo launchctl load -w /System/Library/LaunchAgents/${agent}.plist
        launchctl load -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
    echo "[OK] Agent ${agent} enabled"
done

# Daemons to enable
for daemon in "${DAEMONS[@]}"
do
    sudo mv /System/Library/LaunchDaemons/${daemon}.plist.bak /System/Library/LaunchDaemons/${daemon}.plist
    {
        sudo launchctl load -w /System/Library/LaunchDaemons/${daemon}.plist
        launchctl load -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    echo "[OK] Daemon ${daemon} enabled"
done