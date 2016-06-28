class LegislatorsController < ApplicationController

  def index
    @legislators = Legislator.all
  end

  def show
    # @legislator = Legislator.find_by(first_name: params[first_name], last_name: params[last_name])

    @legislator = Legislator.find_by(last_name: 'Sanders')

    @issues_percents = []

    # Issue.all.each do |issue|
      issue = ['Energy', 'Families']
      @issues_percents << @legislator.issue_positions(issue)
    # end
    render json: @issues_percents

  end


end
