# Uniform OS X wallpapers for fish users
A simple Fish shell script that sets the same wallpaper on every desktop of OS X at once. Thanks Apple.

## How to install it
Copy `change_wallpaper.fish` to `.config/fish/functions/`

## How to use it
In fish type:
```
change_wallpaper <path_to_image>
``` 
e.g.:
```
change_wallpaper /Library/Desktop\ Pictures/Moon.jpg
```

# Not-so-frequently Asked Questions
### Which version of OS X is it compatible with?
I've tested it on OS X Sierra 10.12.1 and it works fine. As long as the way `desktoppicture.db` is used doesn't change it should keep working on future releases. I don't know if it is compatible with older versions. Try it at your own risk.

### Does it work with multiple monitors?
Yes.

### What happens if I mess up my `desktoppicture.db`?
Delete it and restart `Dock`. A new file will be created and the backgrounds will be set to default.
```
rm ~/Library/Application\ Support/Dock/desktoppicture.db
killall Dock
```

### Does it work with bash?
No, but the SQLite calls are still valid. Just change everything else in the script.
