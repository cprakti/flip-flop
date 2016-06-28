class PagesController < ApplicationController
  def index
  end
  
  def home
    @issues = Issue.order("name asc")
  end

  def about
  end

end
