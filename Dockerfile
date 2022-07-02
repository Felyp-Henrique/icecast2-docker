FROM alpine:3.15.0

VOLUME /etc
VOLUME /app
VOLUME /var

WORKDIR /app

RUN apk update && apk add --no-cache icecast \
    && adduser -D admin \
    && echo admin:admin | chpasswd \
    && mkdir -p /var/log/icecast2 \
    && touch /var/log/icecast2/{error,access}.log

USER admin:admin

# flags
ENV DEBUG 0

# admin data
ENV IC_AUTH_ADMIN "admin"
ENV IC_AUTH_ADMIN_PASS "hackme"

# source data
ENV IC_SOURCE_PASS "hackme"

# general configuration
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

COPY templates /app/
COPY scripts/start.sh /app/
COPY builds/builds/linux/icegen /app/

ENTRYPOINT [ "/bin/sh", "/app/start.sh" ]