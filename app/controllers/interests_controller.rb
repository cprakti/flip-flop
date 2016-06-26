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

          ## The 2 methods we use to parse all 3200 tweets. But the load time will be long, so for now while we test, we're only parsing 40.

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

        def client.get_all_tweets(politician)
          options = {:count => 250, :include_rts => true}
          user_timeline(politician, options)
        end

        @all_tweets = client.get_all_tweets(@politician.twitter_handle)
    else
      redirect_to root_path
    end

  end


end
