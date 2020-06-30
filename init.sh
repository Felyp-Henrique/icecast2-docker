#!/bin/sh

python3 /config.py

sudo -Eu icecast2 icecast2 -c /etc/icecast2/icecast.xml
