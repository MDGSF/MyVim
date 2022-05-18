#!/usr/bin/env bash
# 0 1 * * * /bin/bash nginx_log_rotate.sh
LogDir="/var/log/nginx"
PreDate=$(date +%F -d -1day)
BackupDir="backup-$PreDate"
cd $LogDir
if [ ! -d $BackupDir ]; then
  mkdir -p $BackupDir
fi
mv *.log $BackupDir
nginx -s reopen
tar -zcvf $BackupDir.tar.gz $BackupDir
rm -rf $BackupDir
find $LogDir -mtime +7 -name "*.tar.gz" -exec rm -rf {} \;
