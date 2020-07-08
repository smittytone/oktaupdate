#!/usr/bin/env bash

# @version 1.0.2

# Create scrip[ts folder if it's not present
echo "Installing files..."
plist_path="$HOME/Library/LaunchAgents/com.bps.oktaupdate.plist"
script_path="$HOME/Library/Application Scripts/com.bps.oktaupdate"

# Make an Application Scripts directory if it doesn't exist
if [ ! -e "$script_path" ]; then
    mkdir "$script_path" || exit
fi

# Install the files
cp oktaupdate.scpt "$script_path/oktaupdate.scpt"
cp com.bps.oktaupdate.plist "$plist_path"

# Is the launch agent already installed?
launchctl list com.bps.oktaupdate >> /dev/null
utility_status=$?
if [ $utility_status -eq 0 ]; then
    # Unload the existing version of the launch agent
    echo "Unloading old launch agent..."
    launchctl unload "$plist_path"
fi

# Load the launch agent
echo "Loading launch agent..."
launchctl load "$plist_path"
