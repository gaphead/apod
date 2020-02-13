require 'open-uri'
require 'nokogiri'

# url format is: "ap" + two-digit year + two-digit month + two-digit day
# first content is /ap950616.html, then /ap950620.html, then daily.


class Page
  def initialize(url)
    @url = url
    @html_file = open(url).read
    @html_doc = Nokogiri::HTML(@html_file)
    @title = @html_doc.search('title').text.strip
    @body_text = @html_doc.css('p a').each { |a| puts "#{a.text} - #{a.attribute('href').value}" }
    @root_url = "https://apod.nasa.gov"
    @image = "#{@root_url}/#{@html_doc.css('p a')[1].attribute('href').value}"
  end
end

years = %w[95 96 97 98 99 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20]
months = %w[01 02 03 04 05 06 07 08 09 10 11 12]
days = %w[01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31]

# root url
root = "https://apod.nasa.gov"

# page url e.g.
url = "https://apod.nasa.gov/apod/ap200209.html"

# parse html
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

# page title
html_doc.search('title').text.strip

# returns the url and link text for each <a> within <p>
html_doc.css('p a').each { |a| puts "#{a.text} - #{a.attribute('href').value}" }

# returns <p> text (description of image) on page
html_doc.css('p').text.strip.gsub(/\n/, ' ').gsub(/\"/, "'").gsub(/\s{2,}/, ' ')
