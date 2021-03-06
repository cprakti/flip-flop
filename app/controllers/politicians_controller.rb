class PoliticiansController < ApplicationController
    def index
        if params.has_key?(:search)
            @politicians = Politician.search(params[:search])
        else
            @politicians = Politician.order("name asc")
        end
        if request.xhr?
            render :layout => false
        end
    end

    def show
        @politician = Politician.find_by(id: params[:id])
        if @politician
        else
            redirect_to root_path
        end
    end

    #/politicion/:id/tweet_data
    def tweet_data
          @politician = Politician.find_by(id: params[:id])
          @issues = @politician.issues

          respond_to do |format|
          format.json {
            render :json => @politician.issues_mention_counts
          }
        end
    end
    #  def tweet_data
    # # point1 = model_method(1)
    # # point2 = model_method(2)
    #     respond_to do |format|
    #       format.json {
    #         render :json => [55,66,77]
    #       }
    #     end
    # end

   

end

