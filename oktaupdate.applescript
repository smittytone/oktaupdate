# Set the application name to the browser you are using
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
			if title of a_tab is "Twilio - My Applications" then
				set done_flag to 1
				tell a_window
					reload a_tab
				end tell
			end if
			if done_flag is 1 then
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