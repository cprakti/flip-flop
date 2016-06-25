class IssuesController < ApplicationController

  def index
    @issues = Issue.all
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
