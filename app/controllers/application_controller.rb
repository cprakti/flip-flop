class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'twitter'



  # before_filter :get_all_tweets

  # def collect_with_max_id(collection=[], max_id=nil, &block)
  #   response = yield(max_id)
  #   collection += response
  #   response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  # end

  # def client.get_all_tweets(user)
  #   collect_with_max_id do |max_id|
  #   options = {count: 200, include_rts: true}
  #   options[:max_id] = max_id unless max_id.nil?
  #   user_timeline(user, options)
  #   end
  # end

  # def load_tweets
  #   @tweets = Twitter.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
  # end



end
