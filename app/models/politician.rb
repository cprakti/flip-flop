class Politician < ActiveRecord::Base
  has_many :politicianissues
  has_many :issues, through: :politicianissues


  # def politician_tweets(politician)
  #   options = {:count => 5, :include_rts => true}
  #   user_timeline(politician, options)
  # end

end
