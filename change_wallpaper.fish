
function change_wallpaper --description "Change wallpaper on every Desktop"

	set DB_PATH ~/Library/Application\ Support/Dock/desktoppicture.db

	# Build SQLite commands:
	# - Delete old data from desktoppicture.db
	# - Insert a single row in the "data" table
	# - Get the number of spaces
	set SQL_CMD "DELETE FROM data; 
				 DELETE FROM preferences;
				 INSERT INTO data (value)
				 	VALUES (\"$argv[1]\");
				 SELECT COUNT(*) AS nspaces
					FROM pictures;"

	# Run SQLite and store result
	set nspaces (sqlite3 $DB_PATH $SQL_CMD)

	# Build SQlite input string
	set input_string "(1,1,1)"
	set i 2
	while math "$i<=$nspaces" > /dev/null
		set new_input 
		set input_string $input_string ", (1,1,$i)"
	  	set i (math "$i+1")	
	end
	set input_string $input_string ";"

	# Add new entries to the table
	set SQL_CMD "INSERT INTO preferences
				 VALUES $input_string"
	sqlite3 $DB_PATH $SQL_CMD

	# Delete old log-in blurred background
	rm /Library/Caches/com.apple.desktop.admin.png
	
	killall Dock
end
