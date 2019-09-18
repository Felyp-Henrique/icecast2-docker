#!/usr/bin/env ruby

# All variables that config the fields of file icecast.xml are environment variable
# of shell, then this script only get this variables through ENV hashtable and set 
# the file /etc/icecast2/icecast.xml using ERB template processor

require 'erb'

$icecast_configuration = ""

puts 'Generating the new file /etc/icecast2/icecast.xml'

File.open '/icecast.xml.erb', 'r' do |file|
  $icecast_configuration << ERB.new(file.read).result
end

puts 'Saving now...'

File.open '/etc/icecast2/icecast.xml', 'w' do |file|
  file.puts $icecast_configuration
end
