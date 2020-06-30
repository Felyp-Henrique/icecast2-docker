FROM debian:9.11-slim

MAINTAINER "perl19(docker hub) or Felyp-Henrique(github)"

RUN apt-get update && \
    apt-get full-upgrade --yes && \
    apt-get install sudo icecast2 --yes && \
    apt-get install python3 python3-pip --yes && \
    chown -R icecast2 /etc/icecast2

ADD ./requirements.txt ./requirements.txt

RUN pip3 install -r ./requirements.txt

ENV IC_AUTH_ADMIN "admin"
ENV IC_AUTH_ADMIN_PASS "hackme"

ENV IC_SOURCE_PASS "hackme"

ENV IC_HOSTNAME "localhost"
ENV IC_PORT "8000"

ENV IC_LIMITS_CLIENTS "1000"
ENV IC_LIMITS_SOURCES "1"

ENV IC_LIMITS_QUEUE_SIZE "524288"
ENV IC_LIMITS_BURST_SIZE "65535"

ENV IC_LIMITS_CLIENT_TIMEOUT "30"
ENV IC_LIMITS_HEADER_TIMEOUT "15"
ENV IC_LIMITS_SOURCE_TIMEOUT "10"

ENV IC_RELAY_ON "0"
ENV IC_RELAY_HOST "127.0.0.1"
ENV IC_RELAY_PORT "8001"
ENV IC_RELAY_UPDATE_INTERVAL "120"
ENV IC_RELAY_PASSWORD "hackme"
ENV IC_RELAY_DEMAND "1"

EXPOSE 8000

VOLUME /etc/icecast2
VOLUME /etc/default/
VOLUME /var/log/icecast2/

ADD ./icecast.xml /icecast.xml
ADD ./config.py /config.py
ADD ./init.sh /init.sh
ADD ./etc /etc

CMD sh /init.sh
