FROM debian:9.11-slim

MAINTAINER "perl19 & danielm1999"

RUN apt-get update && \
    apt-get full-upgrade --yes && \
    apt-get install icecast2 ruby sudo --yes && \
    chown -R icecast2 /etc/icecast2

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

EXPOSE 8000

VOLUME /etc/icecast2
VOLUME /etc/default/
VOLUME /var/log/icecast2/

ADD ./icecast.xml.erb /icecast.xml.erb
ADD ./config.rb /config.rb
ADD ./init.sh /init.sh
ADD ./etc /etc

CMD sh /init.sh
