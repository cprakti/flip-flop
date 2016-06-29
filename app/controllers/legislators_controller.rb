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
    # @legislator = Legislator.find_by(last_name: "Sanders")
    @legislator = Legislator.find_by(id: params[:id])
    # @categories_percents = []
    # @legislator.all_positions.each do |object|
    #   @categories_percents << object[:yes]
    #   @categories_percents << object[:no]
    # end

    #  respond_to do |format|
    #       format.json {
    #         render :json => @categories_percents
    #       }
    #   end
  end

  def legislator_votes
      @legislator = Legislator.find_by(id: params[:id])
      @categories_percents = []
      @legislator.all_positions.each do |object|
      @categories_percents << object[:yes]
      @categories_percents << object[:no]
    end

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
#             render :json => @legislator.yes_vote_list
#           }
#     end
# end

#   def no_votes #create route
#       @legislator = Legislator.find_by(last_name: "Sanders")
#       @categories_percents = []
#       Category.all.each do |category|
#       subjects = category.subjects
#       @categories_percents << (@legislator.category_positions(subjects)).merge!(name: category.name)
#       end

      

# end

# def yes_votes 
#       # @legislator = Legislator.find_by(last_name: "Sanders")
#       @legislator = Legislator.find_by(id: params[:id])
#       @categories_percents = []
#       Category.all.each do |category|
#             subjects = category.subjects
#             @categories_percents << (@legislator.category_positions(subjects)).merge!(name: category.name)
#       end
#       # binding.pry
      
#       respond_to do |format|
#             format.json {
#                   render :json => @categories_percents[:yes].where(name: "Immigration")
#                   # binding.pry
#             }
#       end
# end

# def no_votes 
#       @legislator = Legislator.find_by(last_name: "Sanders")
#       @categories_percents = []
#       Category.all.each do |category|
#             subjects = category.subjects
#             @categories_percents << (@legislator.category_positions(subjects)).merge!(name: category.name)
#       end

# >>>>>>> Bind data to bar graph
# #       respond_to do |format|
# #             format.json {
# #             render :json => no_vote_list
# #           }
# #     end
# # end
# <<<<<<< a1ebf9303377a2ec62c477d97156e812a3a85617
# =======

# def yes_votes_on(issue_name)
#       self[:yes].where(name: issue_name)
# end
# >>>>>>> Bind data to bar graph

# def parse_yes_votes(votes_array)
#   votes_array.select do |vote|
#   vote.has_key?(:yes)
#   end
# end


# def parse_no_votes(votes_array)
#    votes_array.select do |vote|
#      vote.has_key?(:no)
#   end
# end


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


# def yes_vote_list
#   parse_yes_votes(@categories_percents).map do |vote|
#     vote.values.join
#   end
# end



# def no_vote_list
#   parse_no_votes(@categories_percents).map do |vote|
#     vote.values.join 
#   end
# end

end
