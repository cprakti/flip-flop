class GraphController < ApplicationController
  def index
  end

  def tweet_data
    # point1 = model_method(1)
    # point2 = model_method(2)
    respond_to do |format|
      format.json {
        render :json => ["Issue name: this politician has tweeted X many times about this issue in the last X days", 55,66,77]
      }
    end
  end


 


end
