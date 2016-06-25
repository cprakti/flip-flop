class PoliticianController < ApplicationController

  def index
    client = Twitter::REST::Client.new do |config|
    config.consumer_key        = TWITTER_CONSUMER_KEY
    config.consumer_secret     = TWITTER_CONSUMER_SECRET
    config.access_token        = TWITTER_ACCESS_TOKEN
    config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    end
  end

  def client.get_all_tweets(politician)
    options = {:count => 5, :include_rts => true}
    user_timeline(politician, options)
  end

  def show
    @politican = Politican.find_by(id: params[:id])
    @tweets = client.get_all_tweets(@politician.twitter_handlle)
  end



end

