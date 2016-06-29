class PagesController < ApplicationController
  
  def index
  end
  
  def home
    @issues = Issue.order("name asc")
    @gunlaws = Issue.find(1)
    @immigration = Issue.find(2)
    @lgbtq = Issue.find(3)
    @economy = Issue.find(4)
    @healthcare = Issue.find(5)
  end

  def about
  end

end
