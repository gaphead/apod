require 'open-uri'
require 'nokogiri'

url = "https://apod.nasa.gov/apod/ap200209.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# html_doc.search('')
