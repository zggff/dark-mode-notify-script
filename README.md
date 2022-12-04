# dark mode notify script

this script updates themes for terminal emulors based on macos theme

## prerequisites
you need to have log files setup for the sevice

```
echo "" > dark-mode-notify-stderr.log
echo "" > dark-mode-notify-stdout.log
```



## instructions
```
cp com.zggff.dark-mode-notify.plist ~/Library/LaunchAgents/com.zggff.dark-mode-notify.plist
launchctl bootstrap gui/<user_id> ~/Library/LaunchAgents/com.zggff.dark-mode-notify.plist
launchctl kickstart gui/<user_id>/com.zggff.dark-mode-notify 
```

## dependencies
this setup depends on [dark-mode-notify](https://github.com/bouk/dark-mode-notify)
