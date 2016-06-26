class GraphController < ApplicationController
 def index
  end
 
  def tweet_data
    # point1 = model_method(1)
    # point2 = model_method(2)
    respond_to do |format|
      format.json {
        render :json => [55,66,77]
      }
    end
  end
end
