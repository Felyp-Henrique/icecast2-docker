#!/bin/sh

set +e

if [[ "$DEBUG" -eq "1" ]]; then
    echo "Local: $(pwd)"

    ls -l
fi

./icegen \
    --admin         "$IC_AUTH_ADMIN" \
    --adminpass     "$IC_AUTH_ADMIN_PASS" \
    --burst         "$IC_LIMITS_BURST_SIZE" \
    --clitimeout    "$IC_LIMITS_CLIENT_TIMEOUT" \
    --hdrtimeout    "$IC_LIMITS_HEADER_TIMEOUT" \
    --host          "$IC_HOSTNAME" \
    --numclients    "$IC_LIMITS_CLIENTS" \
    --numsources    "$IC_LIMITS_SOURCES" \
    --port          "$IC_PORT" \
    --queue         "$IC_LIMITS_QUEUE_SIZE" \
    --srcpass       "$IC_SOURCE_PASS" \
    --srctimeout    "$IC_LIMITS_SOURCE_TIMEOUT"

icecast -c icecast.xml

if [[ "$DEBUG" -eq "1" ]]; then
    ash
fi