class Politician < ActiveRecord::Base
  has_many :politicianissues
  has_many :issues, through :politicianissues

end
