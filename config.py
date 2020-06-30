#!/usr/bin/env ruby

import jinja2
import os

CONFIG = {
  "admin": os.environ['IC_AUTH_ADMIN'],
  "admin_pass": os.environ['IC_AUTH_ADMIN_PASS'],

  "src_pass": os.environ['IC_SOURCE_PASS'],

  "host": os.environ['IC_HOSTNAME'],
  "port": os.environ['IC_PORT'],

  "num_clients": os.environ['IC_LIMITS_CLIENTS'],
  "num_sources": os.environ['IC_LIMITS_SOURCES'],

  "queue": os.environ['IC_LIMITS_QUEUE_SIZE'],
  "burst": os.environ['IC_LIMITS_BURST_SIZE'],

  "cli_timeout": os.environ['IC_LIMITS_CLIENT_TIMEOUT'],
  "hdr_timeout": os.environ['IC_LIMITS_HEADER_TIMEOUT'],
  "src_timeout": os.environ['IC_LIMITS_SOURCE_TIMEOUT'],

  "relay_on": os.environ['IC_RELAY_ON'] == "1",
  "relay_host": os.environ['IC_RELAY_HOST'],
  "relay_port": os.environ['IC_RELAY_PORT'],
  "relay_update_interval": os.environ['IC_RELAY_UPDATE_INTERVAL'],
  "relay_user": os.environ['IC_RELAY_USER'],
  "relay_password": os.environ['IC_RELAY_PASSWORD'],
  "relay_demand": os.environ['IC_RELAY_DEMAND'],
}

def generate_icecast_xml():
  with open("/icecast.xml", "r") as file:
    icecast_xml = file.read()
  
  template = jinja2.Template(icecast_xml)

  return template.render(**CONFIG)

def save_icecast_xml(icecast_xml):
  with open("/etc/icecast2/icecast.xml", "w") as file:
    file.write(icecast_xml)

def main():
  icecast_xml = generate_icecast_xml()
  save_icecast_xml(icecast_xml)
  print(CONFIG)
  print()
  print(icecast_xml)

if __name__ == "__main__":
  main()