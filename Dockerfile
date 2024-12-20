FROM ubuntu:20.04

RUN apt update && apt install -y rsync openssh-client

ADD rsync.sh /opt/rsync.sh
ADD run.sh /opt/run.sh
ADD entrypoint.sh /opt/entrypoint.sh

WORKDIR /opt

CMD ["/opt/entrypoint.sh"]