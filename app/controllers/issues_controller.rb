class IssuesController < ApplicationController

  def index
    @issues = Issue.order("name asc")
    @gunlaws = Issue.find(1)
    @immigration = Issue.find(2)
    @lgbtq = Issue.find(3)
    @economy = Issue.find(4)
    @healthcare = Issue.find(5)
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
