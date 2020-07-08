# oktaupdate 1.0.2 #

For macOS users, this Launch Agent regularly runs an AppleScript which in turn refreshes a browser window displaying the Okta applications page. For me, Okta periodically signs itself out, so I have to login again just to access one application. The Launch Agent prevents this.

The refresh occurs every five minutes, but this can be changed by altering the `StartInteval` value in `com.bps.oktaupdate.plist`.

The target browser is Google Chrome, but this can be changed by editing the line `tell application "Google Chrome"` in `oktaupdate.applescript` and saving the files as a script: `oktaupdate.scpt` (requires macOS’ Script Editor app).

**Note** The file `oktaupdate.applescript` is not used; it’s included so that the code in the binary `.scpt` file can be easily viewed in a text editor.

## Installation ##

Just run the following on your Mac:

1. `git clone https://github.com/smittytone/oktaupdate.git`
2. `cd oktaupdate`
3. `./install.sh`
