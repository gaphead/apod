require 'open-uri'
require 'nokogiri'

base_url = "https://apod.nasa.gov/apod"

url = "https://apod.nasa.gov/apod/ap200209.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# html_doc.search('')

# pp html_doc

html_doc.search('img').each do |element|
  puts "#{base_url}/#{element.attributes['src']}"
end
