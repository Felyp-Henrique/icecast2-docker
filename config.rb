#!/usr/bin/env ruby

# All variables that config the fields of file icecast.xml are environment variable
# of shell, then this script only get this variables through ENV hashtable and set 
# the file /etc/icecast2/icecast.xml using ERB template processor

require 'erb'

$admin = ENV['IC_AUTH_ADMIN']
$admin_pass = ENV['IC_AUTH_ADMIN_PASS']

$src_pass = ENV['IC_SOURCE_PASS']

$host = ENV['IC_HOSTNAME']
$port = ENV['IC_PORT']

$num_clients = ENV['IC_LIMITS_CLIENTS']
$num_sources = ENV['IC_LIMITS_SOURCES']

$queue = ENV['IC_LIMITS_QUEUE_SIZE']
$burst = ENV['IC_LIMITS_BURST_SIZE']

$cli_timeout = ENV['IC_LIMITS_CLIENT_TIMEOUT']
$hdr_timeout = ENV['IC_LIMITS_HEADER_TIMEOUT']
$src_timeout = ENV['IC_LIMITS_SOURCE_TIMEOUT']

# $config variable for save new configuration icecast.xml 
$config = ""

puts 'Generating the new file /etc/icecast2/icecast.xml'

File.open '/icecast.xml.erb', 'r' do |file|
  $config << ERB.new(file.read).result
end

puts 'Saving now...'

File.open '/etc/icecast2/icecast.xml', 'w' do |file|
  file.puts $config
end
