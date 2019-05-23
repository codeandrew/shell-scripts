#!/bin/sh
ssh <user>@<mac-without-screen>

 sudo defaults write /var/db/launchd.db/com.apple.launchd/overrides.plist com.apple.screensharing -dict Disabled -bool false
 sudo launchctl load /System/Library/LaunchDaemons/com.apple.screensharing.plist
/System/Library/LaunchDaemons/com.apple.screensharing.plist: Service is disabled
 sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.screensharing.plist
