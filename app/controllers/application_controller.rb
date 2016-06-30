class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include InterestsHelper


  def disable_top_home_link
    @disable_top_home_link = true
  end


  require 'twitter'

  # def url_changer(string)
  #   binding.pry
  #     regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/
  #     string.gsub(regex) {|url|'<a href="#{url}"></a>'}
  # end

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
