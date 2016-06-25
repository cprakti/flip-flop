class Issue < ActiveRecord::Base
  has_many :politicianissues
  has_many :politicians, through :politicianissues


end
