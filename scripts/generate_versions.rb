#!/usr/bin/env ruby

require 'httparty'
require 'nokogiri'

page = HTTParty.get("https://www.mongodb.org/dl/linux/x86_64")
parsed_page = Nokogiri::HTML(page)

table = parsed_page.css('table') # should have only one
rows  = table.css('tr')

file_names = rows.map do |row|
  row&.css('td')&.first&.css('a')&.text
end.reject { |x| x == nil }

REGEX = /mongodb-linux-x86_64-(\d.\d.\d*).tgz/

versions = file_names.map do |file_name|
  if file_name =~ REGEX
    match = file_name.match(REGEX)
	match[1] # return first capture, which is the version name
  else
    nil
  end
end.reject { |x| x == nil }.sort_by do |v|
  major, minor, patch = v.split(".").map(&:to_i)
  major * 10000 + minor * 100 + patch
end

versions.each do |version|
  puts version
end
