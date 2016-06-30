class PagesController < ApplicationController
  before_filter :disable_top_home_link, only: [:home]

  def index
  end
  
  def home
    @issues = Issue.order("name asc")
    @twitter_gunlaws = Issue.find(1)
    @twitter_immigration = Issue.find(2)
    @twitter_lgbtq = Issue.find(3)
    @twitter_economy = Issue.find(4)
    @twitter_healthcare = Issue.find(5)
    @congress_gunlaws = Issue.find(1)
    @congress_immigration = Issue.find(2)
    @congress_lgbtq = Issue.find(3)
    @congress_economy = Issue.find(4)
    @congress_healthcare = Issue.find(5)
  end

  def about
  end


end
