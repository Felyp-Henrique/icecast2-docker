#!/usr/bin/env ruby

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

# $out variable for save new configuration icecast.xml
$out = ""

puts 'Generating the new file /etc/icecast2/icecast.xml'

File.open '/icecast.xml.erb', 'r' do |file|
  $out << ERB.new(file.read).result
end

puts 'Saving now...'

File.open '/etc/icecast2/icecast.xml', 'w' do |file|
  file.puts $out
end
