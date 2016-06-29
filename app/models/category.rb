class Category < ActiveRecord::Base
  has_many :subjects

   def all_positions_all_categories
    Category.all.map do |category|
      (self.category_positions(category)).merge(name: category.name)
    end
  end

  def category_positions(category)
    rep_category_yes = []
    rep_category_no = []
    rep_category_total = []
    dem_category_yes = []
    dem_category_no = []
    dem_category_total = []
    ind_category_yes = []
    ind_category_no = []
    ind_category_total = []

    rep_category_yes = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "R"}, positions: {vote_position: "Yes"})
    rep_category_no = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "R"}, positions: {vote_position: "No"})
    rep_category_total = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "R"})
    dem_category_yes = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "D"}, positions: {vote_position: "Yes"})
    dem_category_no = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "D"}, positions: {vote_position: "No"})
    dem_category_total = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "D"})
    ind_category_yes = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "I"}, positions: {vote_position: "Yes"})
    ind_category_no = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "I"}, positions: {vote_position: "No"})
    ind_category_total = Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {party: "I"})

    rep_category_percent_yes = rep_category_yes.uniq{|position| position.id}.count.to_f / rep_category_total.uniq{|position| position.id}.count.to_f
    rep_category_percent_no = rep_category_no.uniq{|position| position.id}.count.to_f / rep_category_total.uniq{|position| position.id}.count.to_f
    dem_category_percent_yes = dem_category_yes.uniq{|position| position.id}.count.to_f / dem_category_total.uniq{|position| position.id}.count.to_f
    dem_category_percent_no = dem_category_no.uniq{|position| position.id}.count.to_f / dem_category_total.uniq{|position| position.id}.count.to_f
    ind_category_percent_yes = ind_category_yes.uniq{|position| position.id}.count.to_f / ind_category_total.uniq{|position| position.id}.count.to_f
    ind_category_percent_no = ind_category_no.uniq{|position| position.id}.count.to_f / ind_category_total.uniq{|position| position.id}.count.to_f

    {rep_yes: rep_category_percent_yes, rep_no: rep_category_percent_no, dem_yes: dem_category_percent_yes, dem_no: dem_category_percent_no, ind_yes: ind_category_percent_yes, ind_no: ind_category_percent_yes}
  end


end
