#!/bin/bash

MYSQL_USER=$1
MYSQL_PASSWORD=$2
MYSQL_DATABASE=$3

backup_filename=$MYSQL_DATABASE-`date +%A`
backup_dirpath=/backups
/usr/bin/mysqldump --tz-utc -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" "$MYSQL_DATABASE" | gzip > $backup_dirpath/$backup_filename.sql.gz
echo "Backup $backup_dirpath/$backup_filename.sql.gz completed" 1>&2
