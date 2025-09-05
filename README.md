# Downloads Folder Automatic Cleanup

[![Netlify Status](https://api.netlify.com/api/v1/badges/a001d783-8dc3-41f5-bcf7-99473e9a2510/deploy-status)](https://app.netlify.com/projects/aesthetic-sherbet-3b4a2b/deploys)

This set of scripts automatically cleans up your Downloads folder by removing files that are older than 30 days.

## Features

- Only removes files older than 30 days
- Skips files that are currently in use
- Logs all actions for reference
- Runs automatically once per day at 1:00 AM
- Can be run manually at any time

## Installation

1. Make both scripts executable:
   ```
   chmod +x cleanup_downloads.sh setup_cleanup_job.sh
   ```

2. Run the setup script to install the automatic job:
   ```
   ./setup_cleanup_job.sh
   ```

## Manual Execution

You can run the cleanup script manually at any time:
```
~/bin/cleanup_downloads.sh
```

## Logs

Logs are stored in:
- `~/Library/Logs/cleanup_downloads.log` - Main cleanup log
- `~/Library/Logs/cleanup_downloads_error.log` - Error log for scheduled job
- `~/Library/Logs/cleanup_downloads_output.log` - Output log for scheduled job

## Customization

To change the number of days before files are deleted, edit the `DAYS_OLD` variable in `~/bin/cleanup_downloads.sh`.

## Uninstallation

To uninstall:
```
launchctl unload ~/Library/LaunchAgents/com.user.cleanupdownloads.plist
rm ~/Library/LaunchAgents/com.user.cleanupdownloads.plist
rm ~/bin/cleanup_downloads.sh
```

# homebrew-intelligent-terminal
