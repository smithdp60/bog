require 'flickraw'

FlickRaw.api_key=ENV["API_KEY"]
FlickRaw.shared_secret=ENV["API_SECRET"]

list = flickr.photos.search :text => "hippogriff", :sort => "relevance"

id     = list[0].id
secret = list[0].secret
info = flickr.photos.getInfo :photo_id => id, :secret => secret

sizes = flickr.photos.getSizes :photo_id => id

puts FlickRaw.url(info)