class Legislator < ActiveRecord::Base

  has_many :positions, foreign_key: 'bioguide_id', primary_key: 'bioguide_id'

  validates :bioguide_id, :chamber, presence: true

  def all_positions
    Category.all.map do |category|
      (self.category_positions(category)).merge(name: category.name)
    end
  end

  def category_positions(category)
    legis_category_yes = []
    legis_category_no = []
    legis_category_total = []
      legis_category_yes += Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {last_name: "#{self.last_name}"}, positions: {vote_position: "Yes"})
      legis_category_no += Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {last_name: "#{self.last_name}"}, positions: {vote_position: "No"})
      legis_category_total += Position.joins(:legislator, vote: {bill: {subjects: :category}}).where(categories: {name: category.name}, legislators: {last_name: "#{self.last_name}"})
    category_percent_yes = legis_category_yes.uniq{|position| position.id}.count.to_f / legis_category_total.uniq{|position| position.id}.count.to_f
    category_percent_no = legis_category_no.uniq{|position| position.id}.count.to_f / legis_category_total.uniq{|position| position.id}.count.to_f
     {yes: category_percent_yes, no:category_percent_no}
  end #end of method

  def self.search(search)
    if search
      Legislator.where('LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ?', "%#{search.downcase}%", "%#{search.downcase}%")
    end
  end

  def categories_percents
    categories_percents_array = []
    self.each do |object|
      categories_percents_array << object[:yes]
      categories_percents_array << object[:no]
    end
    return categories_percents_array
  end #end of method
end #end of class


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


# def yes_vote_list
#   parse_yes_votes(votes_array).map do |vote|
#     vote.values.join
#   end
# end


# def no_vote_list
#   parse_no_votes(votes_array).map do |vote|
#     vote.values.join 
#   end
# end


# end #end of class 

