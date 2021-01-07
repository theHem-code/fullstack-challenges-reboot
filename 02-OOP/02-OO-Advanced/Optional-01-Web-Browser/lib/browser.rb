require 'open-uri'
require 'nokogiri'

class Browser
  def fetch_content(url)
    uri = URI.parse(url)
    doc = Nokogiri::HTML(uri.open)
    doc.content
  end
end
