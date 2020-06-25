#!/usr/bin/env bash

# @version 1.0.1

# Create scrip[ts folder if it's not present
echo "Installing files..."
target="$HOME/Library/Application Scripts/com.bps.oktaupdate"
if ! [ -e "$target" ]; then
    mkdir "$target" || exit
fi

# Install the files
cp oktaupdate.scpt "$target/oktaupdate.scpt"
cp com.bps.oktaupdate.plist "$HOME/Library/LaunchAgents/com.bps.oktaupdate.plist"

# Is the launch agent already installed?
launchctl list com.bps.oktaupdate >> /dev/null
status=$?
if [ $status -eq 0 ]; then
    # Unload the existing version of the launch agent
    echo "Unloading old launch agent..."
    launchctl unload "$HOME/Library/LaunchAgents/com.bps.oktaupdate.plist"
fi

# Load the launch agent
echo "Loading launch agent..."
launchctl load "$HOME/Library/LaunchAgents/com.bps.oktaupdate.plist"
