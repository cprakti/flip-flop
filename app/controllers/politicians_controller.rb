class PoliticiansController < ApplicationController
    def index
        @politicians = Politician.order("name asc")
    end

    def show
    @politician = Politician.find_by(id: params[:id])
        if @politician
        else
            redirect_to root_path
        end
    end
end

