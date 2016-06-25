class InterestsController < ApplicationController

  def show
    @interest = Interest.find_by(id: params[:id], politician_id: params[:politician_id], politician_id: params[:politician_id] )
    @politician = Politician.find_by(id: params[:politician_id])
    @issue = Issue.find_by(id: params[:id])

    if @politician

        client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
        end

        def client.get_all_tweets(politician)
          options = {:count => 400, :include_rts => true}
          user_timeline(politician, options)
        end

        @all_tweets = client.get_all_tweets(@politician.twitter_handle)
    else
      redirect_to root_path
    end

  end


end
