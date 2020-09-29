FROM mariadb:10.5

LABEL description="MySQL 8 with automated backup (w/cron setting as CRON_SCHEDULE env var)"

RUN apt-get update && apt-get install -y cron
RUN mkdir /backups 

ADD backup-mysql.sh /tmp/backup-mysql.sh
ADD docker-entrypoint.sh /tmp/docker-entrypoint.sh
RUN chmod +x /tmp/docker-entrypoint.sh
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]

VOLUME /backups
EXPOSE 3306 33060
CMD ["mysqld"]
