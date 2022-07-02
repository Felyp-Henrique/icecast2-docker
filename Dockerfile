FROM alpine:3.15.0

RUN apk update && apk add --no-cache icecast

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

WORKDIR /app

VOLUME /etc
VOLUME /app
VOLUME /var

COPY templates /app/
COPY tools/start.sh /app/
COPY bin/icecast /app/

ENTRYPOINT [ "/bin/sh", "/app/start.sh" ]