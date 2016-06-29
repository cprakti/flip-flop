class LegislatorsController < ApplicationController

  def index
    @legislators = Legislator.all
  end

  def show
    # @legislator = Legislator.find_by(first_name: params[first_name], last_name: params[last_name])
    @legislator = Legislator.find_by(last_name: "Sanders")
    @categories_percents = []
    Category.all.each do |category|
      subjects = category.subjects
      @categories_percents << (@legislator.category_positions(subjects)).merge!(name: category.name)
    end

  end

end
