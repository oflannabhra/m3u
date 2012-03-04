#!/usr/bin/ruby

require 'rubygems'
require 'mp3info'

#
# Constraints: 
# Files in the current directory have valid id3 tags.
#

File.open("#{Dir.pwd}.m3u", "w") do |playlist|
	playlist.puts "#EXTM3U"
	Dir.glob("*.mp3").each { |filename|
		Mp3Info.open(filename) do |song|
			playlist.puts "\#EXTINF:#{song.length.round},#{song.tag.artist} - #{song.tag.title}"
			playlist.puts "#{filename}"
		end
	}
end