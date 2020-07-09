# oktaupdate 2.0.0 #

For macOS users, this Launch Agent regularly runs an AppleScript which refreshes a browser window displaying the Okta applications page. I find that Okta periodically signs itself out, so I have to login again just to access one application. The Launch Agent prevents this.

The refresh occurs every five minutes, but this can be changed by altering the `StartInterval` value in `com.bps.oktaupdate.plist`.

The target browsers are Google Chrome and Safari. Firefox is not supported because it does not provide AppleScript access to window tabs.

Change the value of *the_target* in `oktaupdate.applescript` and recompile to specify your specific Okta home page, but the script should operate generically.

**Note** Previous versions of this repo contained a binary AppleScript. This has been removed, and the installer script now always compiles a fresh binary `oktaupdate.scpt` file from the `oktaupdate.applescript` text file.

## Installation ##

Just run the following on your Mac:

1. `git clone https://github.com/smittytone/oktaupdate.git`
2. `cd oktaupdate`
3. `./install.sh`

### Installation Notes ###

The installer creates the directory `$HOME/Library/Application Scripts/com.bps.oktapdate` if it needs to. It then compiles `oktaupdate.applescript` and copies the resulting binary, `oktaupdate.scpt`, into `$HOME/Library/Application Scripts/com.bps.oktapdate`. Finally, it writes `com.bps.oktaupdate.plist` to `$HOME/Library/Launch Agents`, sets the agent running and deletes the local `oktaupdate.scpt` file.