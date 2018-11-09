#!/bin/bash

# IMPORTANT: You will need to disable SIP aka Rootless in order to fully execute this script, you can reenable it after.
# WARNING: It might disable things that you may not like. Please double check the services in the TODISABLE vars.

# Get active services: launchctl list | grep -v "\-\t0"
# Find a service: grep -lR [service] /System/Library/Launch* /Library/Launch* ~/Library/LaunchAgents

# Agents to disable
#DAEMONS+=('com.apple.AirPlayXPCHelper') #Airplay daemon
#DAEMONS+=('com.apple.AOSNotificationOSX') #Notifications
DAEMONS+=('com.apple.appleseed.fbahelperd') #Related to feedback
#DAEMONS+=('com.apple.apsd') #Apple Push Notification Service (apsd) - it's calling home quite often + used by Facetime and Messages
DAEMONS+=('com.apple.awacsd') #Apple Wide Area Connectivity Service daemon - Back to My Mac Feature
DAEMONS+=('com.apple.awdd') #Sending out diagnostics & usage
DAEMONS+=('com.apple.CrashReporterSupportHelper') #Crash reporter
#DAEMONS+=('com.apple.eapolcfg_auth') #perform privileged operations required by certain EAPOLClientConfiguration.h APIs
DAEMONS+=('com.apple.familycontrols') #Parent control
#DAEMONS+=('com.apple.FileSyncAgent.sshd') #Mostlikely sshd on this machine
#DAEMONS+=('com.apple.findmymac') #Find my mac daemon
#DAEMONS+=('com.apple.findmymacmessenger') #Related to find my mac daemon, propably act on commands sent through FindMyDevice in iCloud
#DAEMONS+=('com.apple.icloud.findmydeviced') #Related to find my mac
#DAEMONS+=('com.apple.iCloudStats') #Related to iCloud
#DAEMONS+=('com.apple.laterscheduler') #Schedule something?
#DAEMONS+=('com.apple.locationd') #Propably reading current location
#DAEMONS+=('com.apple.ManagedClient.cloudconfigurationd') #Related to manage current macOS user iCloud
#DAEMONS+=('com.apple.ManagedClient.enroll') #Related to manage current macOS user
#DAEMONS+=('com.apple.ManagedClient.startup') #Related to manage current macOS user
#DAEMONS+=('com.apple.ManagedClient') #Related to manage current macOS user
#DAEMONS+=('com.apple.mbicloudsetupd') #iCloud Settings
#DAEMONS+=('com.apple.netbiosd') #Netbiosd is microsoft's networking service. used to share files between mac and windows
#DAEMONS+=('com.apple.preferences.timezone.admintool') #Time setting daemon
#DAEMONS+=('com.apple.preferences.timezone.auto') #Time setting daemon
#DAEMONS+=('com.apple.remotepairtool') #Pairing devices remotely
#DAEMONS+=('com.apple.rpmuxd') #daemon for remote debugging of mobile devices.
# DAEMONS+=('com.apple.screensharing') #Screensharing daemon
#DAEMONS+=('com.apple.security.FDERecoveryAgent') #Full Disk Ecnryption - Related to File Vault https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man8/FDERecoveryAgent.8.html
DAEMONS+=('com.apple.SubmitDiagInfo') #Feedback - most likely it submits your computer data when click 'About this mac'
#DAEMONS+=('com.apple.trustd') #Propably related to certificates

#AGENTS+=('com.apple.AirPlayUIAgent') #Related Airport
#AGENTS+=('com.apple.AirPortBaseStationAgent') #Related Airport
#AGENTS+=('com.apple.AOSPushRelay') # Related to iCloud https://github.com/fix-macosx/yosemite-phone-home/blob/master/icloud-user-r0/System/Library/PrivateFrameworks/AOSKit.framework/Versions/A/Helpers/AOSPushRelay.app/Contents/MacOS/AOSPushRelay/20141019T072634Z-auser-%5B172.16.174.146%5D:49560-%5B17.110.240.83%5D:443.log
AGENTS+=('com.apple.appleseed.seedusaged') #Feedback assistant
AGENTS+=('com.apple.assistant_service') #Siri
#AGENTS+=('com.apple.assistant') #Keychain
#AGENTS+=('com.apple.bird') #Part of iCloud
#AGENTS+=('com.apple.CalendarAgent') #Calendar events related to iCloud
#AGENTS+=('com.apple.CallHistoryPluginHelper') #Related to call history (iCloud)
#AGENTS+=('com.apple.CallHistorySyncHelper') #Related to call history syncing (iCloud)
#AGENTS+=('com.apple.cloudd') #Related to sync data to iCloud, most likely used by iMessage,Mail,iCloud drive, etc...
AGENTS+=('com.apple.cloudfamilyrestrictionsd-mac') #iCloud Family restrictions
#AGENTS+=('com.apple.cloudpaird') #Related to iCloud
AGENTS+=('com.apple.cloudphotosd') #Propably syncing your photos to icloud
AGENTS+=('com.apple.DictationIM') #Dictation
#AGENTS+=('com.apple.familycircled') #Family notifications, like reminders
#AGENTS+=('com.apple.familycontrols.useragent') #Family notifications, like reminders
#AGENTS+=('com.apple.familynotificationd') #Family notifications, like reminders
AGENTS+=('com.apple.gamed') #GameCenter
#AGENTS+=('com.apple.geodMachServiceBridge') #Located in GeoServices.framework, related to locations maybe used for maps, maybe as well for things like find my mac, or just syping
#AGENTS+=('com.apple.icloud.findmydeviced.findmydevice-user-agent') #Find my device ?
#AGENTS+=('com.apple.icloud.fmfd') #Find my device ?
#AGENTS+=('com.apple.iCloudUserNotifications') #iCloud notifications, like reminders
#AGENTS+=('com.apple.identityservicesd') #Used to auth some apps, as well used by iCloud
#AGENTS+=('com.apple.imagent') #Facetime & Messages
#AGENTS+=('com.apple.IMLoggingAgent') #IMFoundation.framework - Not sure about this one, maybe used to log in to computer on start
AGENTS+=('com.apple.parentalcontrols.check') #Related to parental control
AGENTS+=('com.apple.parsecd') #Used by spotlight and/or siri, propably some suggestions - CoreParsec.framework
AGENTS+=('com.apple.photoanalysisd') #Apple AI to analyse photos stored in Photos.app, most likely to match faces and scenery but it happens to make requests to Apple during process, i have not checked what are those requestes i have just blocked it with Little Snitch
AGENTS+=('com.apple.rtcreportingd') #Related to Home Sharing, most likely it checks if device is auth for home sharing + Facetime
AGENTS+=('com.apple.SafariCloudHistoryPushAgent') #Good one, sending out your browsing history... :)
AGENTS+=('com.apple.safaridavclient') #Sending bookmarks to iCloud, even if you disable it may send your bookmarks to Apple
# AGENTS+=('com.apple.SafariNotificationAgent') #Notifications in Safari
#AGENTS+=('com.apple.security.cloudkeychainproxy3') #Propably related to syncing keychain to icloud
#AGENTS+=('com.apple.security.idskeychainsyncingproxy') #Most likely also related to keychain - IDSKeychainSyncingProxy.bundle
#AGENTS+=('com.apple.security.keychain-circle-notification') #Related to keychain
#AGENTS+=('com.apple.sharingd') #Airdrop, Remote Disks, Shared Directories, Handoff
#AGENTS+=('com.apple.syncdefaultsd') ##Propably related to syncing keychain
#AGENTS+=('com.apple.telephonyutilities.callservicesd') #Handling phone and facetime calls


for agent in "${AGENTS[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
        launchctl unload -w /System/Library/LaunchAgents/${agent}.plist
    } &> /dev/null
    sudo mv /System/Library/LaunchAgents/${agent}.plist /System/Library/LaunchAgents/${agent}.plist.bak
    echo "[OK] Agent ${agent} disabled"
done


for daemon in "${DAEMONS[@]}"
do
    {
        sudo launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
        launchctl unload -w /System/Library/LaunchDaemons/${daemon}.plist
    } &> /dev/null
    sudo mv /System/Library/LaunchDaemons/${daemon}.plist /System/Library/LaunchDaemons/${daemon}.plist.bak
    echo "[OK] Daemon ${daemon} disabled"
done