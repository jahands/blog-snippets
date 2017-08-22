# do/backup-files.sh

#!/bin/bash
RUN="$HOME/do/run-files.sh"
echo '#!/bin/bash' > $RUN
echo 'hb backup --no-ino -c $HOME/hb/files \' >> $RUN
echo `xargs -i echo \"{}\" < $HOME/do/list/backup-files.txt` >> $RUN
/bin/bash $RUN
rm $RUN