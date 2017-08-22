#!/bin/bash
LOG_PATH=$HOME/log/hb-files.log
$HOME/do/backup-files.sh > $LOG_PATH 2>&1
$HOME/hbscripts/discord.sh $LOG_PATH "Laptop Files$1"
