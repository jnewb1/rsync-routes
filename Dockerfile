FROM ubuntu:20.04

ADD rsync.sh /opt/rsync.sh
RUN chmod +x /opt/rsync.sh

ADD cron /etc/cron.d/rsync
RUN chmod 0644 /etc/cron.d/rsync

RUN crontab /etc/cron.d/rsync

ENTRYPOINT ["cron", "-f"]