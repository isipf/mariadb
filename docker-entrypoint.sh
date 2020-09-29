#!/bin/bash
# docker-entrypoint.sh
set -x

crontab -l > tmpCron

#echo "*/2 * * * * /tmp/backup-mysql.sh" >> tmpCron
echo "$CRON_SCHEDULE /tmp/backup-mysql.sh $MYSQL_USER $MYSQL_PASSWORD $MYSQL_DATABASE" >> tmpCron

crontab tmpCron

cron

/usr/local/bin/docker-entrypoint.sh "$@"
