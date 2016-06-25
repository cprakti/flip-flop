class Politician < ActiveRecord::Base
  has_many :politicianissues
  has_many :issues, through :politicianissues

  def $client.get_all_tweets(politician)
    options = {:count => 5, :include_rts => true}
    user_timeline(politician, options)
  end

  def show
    @politican = Politican.find_by(id: params[:id])
    @tweets = $client.get_all_tweets(@politician.twitter_handlle)
  end

  # def politician_tweets(politician)
  #   options = {:count => 5, :include_rts => true}
  #   user_timeline(politician, options)
  # end

end
