FROM ubuntu:20.04

RUN apt update && apt install -y cron rsync openssh-client

ADD rsync.sh /opt/rsync.sh
ADD run.sh /opt/run.sh

ADD cron /etc/cron.d/rsync
RUN chmod 0644 /etc/cron.d/rsync

RUN crontab /etc/cron.d/rsync

WORKDIR /opt

ENTRYPOINT ["cron", "-f"]