# oktaupdate
# version 2.0.0

# Set the value of 'the_target' to your specific Okta home screen URL
set the_target to "okta.com/app/UserHome"

# Check Google Chrome
if application "Google Chrome" is running then
	tell application "Google Chrome"
		set done_flag to 0
		set window_count to 0
		# Run through the windows
		repeat
			try
				set a_window to window window_count
			on error
				exit repeat
			end try
			set tab_count to 0
			# Run through a window's tabs
			repeat
				try
					set a_tab to tab tab_count of a_window
				on error
					exit repeat
				end try
				if URL of a_tab contains the_target then
					#beep
					tell a_window
						reload a_tab
					end tell
					set done_flag to 1
					exit repeat
				end if
				set tab_count to tab_count + 1
			end repeat
			if done_flag is 1 then
				exit repeat
			end if
			set window_count to window_count + 1
		end repeat
	end tell
end if

# Check Safari
if application "Safari" is running then
	tell application "Safari"
		set done_flag to 0
		set window_count to 0
		# Run through the windows
		repeat
			try
				set a_window to window window_count
			on error
				exit repeat
			end try
			set tab_count to 0
			# Run through a window's tabs
			repeat
				try
					set a_tab to tab tab_count of a_window
				on error
					exit repeat
				end try
				if URL of a_tab contains the_target then
					#beep
					tell a_tab
						do JavaScript "reload();"
					end tell
					set done_flag to 1
					exit repeat
				end if
				set tab_count to tab_count + 1
			end repeat
			if done_flag is 1 then
				exit repeat
			end if
			set window_count to window_count + 1
		end repeat
	end tell
end if

# Check Firefox
# TO DO... when Firefox grants AppleScript access to Windows and Tabs