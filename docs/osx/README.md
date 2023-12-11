# OSX
## Create user in Console
> createuser --interactive newuser

## Screensaver
### Set to 1 hour
> sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime 600

### Disable
> sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime 0

## Screenshot save location
```
defaults write com.apple.screencapture location /Users/gjermundskobba/Downloads
```

## Missing python
```
sudo ln -s $(which python3) /usr/local/bin/python
```

## Show path in Finder
```
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder
```
