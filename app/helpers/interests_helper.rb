module InterestsHelper

	def url_changer(string)
		new_string = String.new(string)
  		urls = new_string.scan(/(?:http|https):\/\/[a-z0-9]+(?:[\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(?:(?::[0-9]{1,5})?\/[^\s]*)?/)
  		hashtags = new_string.scan(/\B#\w*[a-zA-Z]+\w*/)
  		atsigns = new_string.scan(/\B@\w*[a-zA-Z]+\w*/)
  		if atsigns.length > 0
  			formatted_atsign = String.new(atsigns[0])
  			formatted_atsign.tr!('@', '')
  			new_string[formatted_atsign] = "<a href='https://twitter.com/#{formatted_atsign}'>#{formatted_atsign}</a>"
  		elsif hashtags.length > 0
  			formatted_hashtag = String.new(hashtags[0])
  			formatted_hashtag.tr!('#', '')
  			new_string[formatted_hashtag] = "<a href='https://twitter.com/#{formatted_hashtag}'>#{formatted_hashtag}</a>"
  		elsif urls.length > 0
  			formatted_url = String.new(urls[0])
  			new_string[formatted_url] = "<a href='#{formatted_url}'>#{formatted_url}</a>"
  		end
  		new_string
	end

end