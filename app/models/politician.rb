class Politician < ActiveRecord::Base
  has_many :interests
  has_many :issues, through: :interests

  validates :name, :political_party, :title, :twitter_handle, :twitter_profile, presence: true

  # attr_reader :all_tweets

  # $client = Twitter::REST::Client.new do |config|
  #   config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  #   config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  #   config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  #   config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  # end

  # def format_tweets(politician)
  #   options = {:count => 40, :include_rts => true}
  #   user_timeline(politician, options)
  # end

  # def all_tweets
  #   $client.format_tweets(self.twitter_handle)
  # end

end

