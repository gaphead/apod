require 'open-uri'
require 'nokogiri'

# url format is: "ap" + two-digit year + two-digit month + two-digit day
# first content is /ap950616.html, then /ap950620.html, then daily.

# years =

url = "https://apod.nasa.gov/apod/ap200209.html"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

puts html_doc.search('title')


# html_doc.search('')
