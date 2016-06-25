class PoliticiansController < ApplicationController

  def index
    $client = Twitter::REST::Client.new do |config|
    config.consumer_key        = TWITTER_CONSUMER_KEY
    config.consumer_secret     = TWITTER_CONSUMER_SECRET
    config.access_token        = TWITTER_ACCESS_TOKEN
    config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    end

    def $client.get_all_tweets(user)
      options = {:count => 5, :include_rts => true}
      user_timeline(user, options)
    end

    @tweets = $client.get_all_tweets(@politician.twitter_handle)

  end

  def show
    @politician = Politician.find_by(id: params[:id])
    @tweets = $client.get_all_tweets(@politician.twitter_handle)
  end



end

