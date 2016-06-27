module InterestsHelper

	def url_changer(string)
		new_string = String.new(string)
  		urls = new_string.scan(/(?:http|https):\/\/[a-z0-9]+(?:[\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(?:(?::[0-9]{1,5})?\/[^\s]*)?/)
  		hashtags = new_string.scan(/\B#\w*[a-zA-Z]+\w*/)
  		atsigns = new_string.scan(/\B@\w*[a-zA-Z]+\w*/)
        atsigns.each do |atsign|
  			 formatted_atsign = String.new(atsign)
  			 formatted_atsign.tr!('@', '')
  			 new_string[formatted_atsign] = "<a target='blank' href='https://twitter.com/#{formatted_atsign}'>#{formatted_atsign}</a>"
        end
        hashtags.each do |hashtag|
  			formatted_hashtag = String.new(hashtag)
  			formatted_hashtag.tr!('#', '')
  			new_string[formatted_hashtag] = "<a target='blank' href='https://twitter.com/#{formatted_hashtag}'>#{formatted_hashtag}</a>"
        end
        urls.each do |url|
  			formatted_url = String.new(url)
  			new_string[formatted_url] = "<a target='blank' href='#{formatted_url}'>#{formatted_url}</a>"
        end
  		new_string
	end
end