# hbscripts/config-backup.sh

#!/bin/bash
$HOME/hbscripts/create-hb-config-backup.sh ~/hb
mv $HOME/$HOSTNAME.hashbackup.conf/* /mnt/c/NOBACKUP/$HOSTNAME.hashbackup.conf
rmdir $HOME/$HOSTNAME.hashbackup.conf