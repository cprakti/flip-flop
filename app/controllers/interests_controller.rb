class InterestsController < ApplicationController

  def show
    @interest = Interest.find_by(id: params[:id], politician_id: params[:politician_id] )
    @politician = Politician.find_by(id: params[:politician_id])
    @issue = Issue.find_by(id: params[:id])

    if @politician
    else
      redirect_to root_path
    end
  end

end
