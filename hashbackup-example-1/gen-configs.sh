# hbscripts/gen-configs.sh

#!/bin/bash
for f in `find $1/* -maxdepth 0`; do hb config -c $f > $f/config.conf 2>&1; done
