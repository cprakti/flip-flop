class GraphController < ApplicationController
  def index
  end

  def tweet_data
    # point1 = model_method(1)
    # point2 = model_method(2)
    respond_to do |format|
      format.json {
        render :json => [55,66,77]
      }
    end

  end


  # def get_issue_tweets
  #   result_bucket = []
  #   self.all_tweets.each do |tweet|
  #     Issuenew.keywords.each do |keyword|
  #       if tweet.full_text.include?(keyword) && result_bucket.include?(tweet) == false
  #         result_bucket << tweet
  #       end
  #     end
  #   end
  #   result_bucket
  # end

  # def parse_issue_tweets
  #   self.get_issue_tweets.each do |issue_tweet|
  #     issue_tweet.full_text
  #   end
  # end


end
