class CategoriesController < ApplicationController

  def index

  end

  def show
    # @category = Category.find_by(name: "Gun Laws")
    # # @legislator = Legislator.find_by(id: params[:id])
    # @parties_percents = []
    # @all_positions = @category.party_positions
    #   @parties_percents << @all_positions[:rep_yes]
    #   @parties_percents << @all_positions[:rep_no]
    #   @parties_percents << @all_positions[:dem_yes]
    #   @parties_percents << @all_positions[:dem_no]
    #   @parties_percents << @all_positions[:ind_yes]
    #   @parties_percents << @all_positions[:ind_no]

    # respond_to do |format|
    #   format.json {
    #     render :json => @categories_percents
    #   }
    # end
  end

  def category_positions
    @category = Category.find_by(name: "Gun Laws")
    # @legislator = Legislator.find_by(id: params[:id])
    @parties_percents = []
    @all_positions = @category.party_positions
      @parties_percents << @all_positions[:rep_yes]
      @parties_percents << @all_positions[:rep_no]
      @parties_percents << @all_positions[:dem_yes]
      @parties_percents << @all_positions[:dem_no]
      @parties_percents << @all_positions[:ind_yes]
      @parties_percents << @all_positions[:ind_no]

    respond_to do |format|
      format.json {
        render :json => @parties_percents
      }
    end
  end

end
