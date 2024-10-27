FROM ubuntu:20.04

RUN apt update && apt install -y rsync openssh-client

ADD rsync.sh /opt/rsync.sh
ADD run.sh /opt/run.sh

WORKDIR /opt

ENV DELAY=3600

CMD ["/bin/bash", "-c", "--" "while true; do /opt/run.sh && sleep $DELAY; done;" ]