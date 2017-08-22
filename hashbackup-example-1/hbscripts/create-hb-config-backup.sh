#!/bin/bash
$(dirname $0)/gen-configs.sh $1
rsync -aPL --include='*/' --include='*.conf' --exclude='*' $1 $HOME/$HOSTNAME.hashbackup.conf
rsync -aP $HOME/do $HOME/$HOSTNAME.hashbackup.conf --exclude='.git'
rsync -aP $HOME/hbscripts $HOME/$HOSTNAME.hashbackup.conf --exclude='.git'
