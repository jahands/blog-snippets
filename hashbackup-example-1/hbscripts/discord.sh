#!/bin/bash
LOG_PATH=$1
DISCORD_USERNAME=$2
if [[ $# -eq 0 ]]; then
     echo "First argument is LOG_PATH (required), second is DISCORD_USERNAME (optional)."
     exit 1
 fi

# Upload log
UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 40 | head -n 1)
DATE=$(date +%Y-%m-%d_%H-%M)
NAME="$DATE"_$UUID.log
rclone copyto $LOG_PATH "b2:my-logs/Backup-$HOSTNAME/$NAME"
msg="\"Backup done! It is $DATE nl_https://txt.jha.sh/logs/Backup-$HOSTNAME/$NAME\""
msg=$(echo $msg | sed 's/nl_/\\n/g')

# Send to Discord
data="{\"username\":\"$DISCORD_USERNAME\",\"content\":$msg}"
echo $data | curl -X POST https://discordapp.com/api/webhooks/<HOOK_ID> -d@-
