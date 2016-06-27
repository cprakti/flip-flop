class Politician < ActiveRecord::Base
  has_many :interests
  has_many :issues, through: :interests

  validates :name, :political_party, :title, :twitter_handle, :twitter_profile, :tweets, presence: true

  mount_uploader :image, ImageUploader


  $client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end

  ## The following 2 grey'ed out methods give us access to all 3200 tweets. Careful, the load time is long.

  # def collect_with_max_id(collection=[], max_id=nil, &block)
  #   response = yield(max_id)
  #   collection += response
  #   response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
  # end

  # def $client.get_all_tweets(politician)
  #   collect_with_max_id do |max_id|
  #   options = {count: 200, include_rts: true}
  #   options[:max_id] = max_id unless max_id.nil?
  #   user_timeline(politician, options)
  #   end
  # end

  #The following method gives us the most recent 200 tweets, hence faster load time:

  def $client.get_all_tweets(politician)
    options = {:count => 250, :include_rts => true}
    user_timeline(politician, options)
  end

  def all_tweets
    $client.get_all_tweets(self.twitter_handle)
  end

  def issue_tweets(the_issue)
    result_bucket = []
    self.all_tweets.each do |tweet|
      self.issues.each do |issue|
        if issue.name == the_issue
          issue.keywords.each do |keyword|
            if tweet.full_text.include?(keyword) && result_bucket.include?(tweet) == false
              result_bucket << tweet
            end
          end
        end
      end
    end
    result_bucket
  end


end

