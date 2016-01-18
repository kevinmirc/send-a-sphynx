class PhotoFetcher < ActiveRecord::Base

  def get_image
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://www.flickr.com/search/?text=sphynx%20cats"))
    i = rand(20)
    string = doc.css('div.photo-list-photo-view')[i].attributes['style'].value
    formated(string)
  end

  def formated(string)
    "http://" + string.scan(/url\(\/\/(.*)\)/).first.first
  end
end