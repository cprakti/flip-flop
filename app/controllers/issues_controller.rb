class IssuesController < ApplicationController

  def index
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

  def show
    @issue = Issue.find_by(id: params[:id])
    @politicians = @issue.politicians
    # @politician = @issue.politicians.find_by(id: params[:id])
  end


#   private
#   def issue_params
#     params.require(:issue).permit(:name)
#   end
end
