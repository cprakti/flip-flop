class LegislatorsController < ApplicationController

  def index
      if params.has_key?(:search)
        @legislators = Legislator.search(params[:search])
      else
        @legislators = Legislator.all
            if request.xhr?
               render :layout => false
            end
      end
  end

  def show
    # @legislator = Legislator.find_by(first_name: params[first_name], last_name: params[last_name])
    @legislator = Legislator.find_by(last_name: "Sanders")
    @categories_percents = []
    @legislator.all_positions.each do |object|
      @categories_percents << object[:yes]
      @categories_percents << object[:no]
    end
    # binding.pry
     respond_to do |format|
          format.json {
            render :json => @categories_percents
          }
      end
  end

# def yes_votes #create route
#       @legislator = Legislator.find_by(last_name: "Sanders")
#       @categories_percents = []
#       Category.all.each do |category|
#       subjects = category.subjects
#       @categories_percents << (@legislator.category_positions(subjects)).merge!(name: category.name)
#       end

#       respond_to do |format|
#             format.json {
#             render :json => @legislator.yes_vote_total
#           }
# end

#   def no_votes #create route
#       @legislator = Legislator.find_by(last_name: "Sanders")
#       @categories_percents = []
#       Category.all.each do |category|
#       subjects = category.subjects
#       @categories_percents << (@legislator.category_positions(subjects)).merge!(name: category.name)
#       end

#       respond_to do |format|
#             format.json {
#             render :json => @legislator.yes_vote_total
#           }
#   end

end
