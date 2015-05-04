FlickRaw.api_key=ENV["API_KEY"]
FlickRaw.shared_secret=ENV["API_SECRET"]

list = flickr.photos.search :text => @beast.name, :sort => "relevance"