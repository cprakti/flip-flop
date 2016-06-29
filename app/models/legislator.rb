class Legislator < ActiveRecord::Base

  has_many :positions, foreign_key: 'bioguide_id', primary_key: 'bioguide_id'

  validates :bioguide_id, :chamber, presence: true


  def category_positions(subject_array)
    legis_category_yes = []
    legis_category_no = []
    legis_category_total = []
    subject_array.each do |subject|
      legis_category_yes += Position.joins(:legislator, vote: {bill: :subjects}).where("subjects.name LIKE ?", "%#{subject.name}%").where(legislators: {last_name: self.last_name}, positions: {vote_position: "Yes"})
      legis_category_no += Position.joins(:legislator, vote: {bill: :subjects}).where("subjects.name LIKE ?", "%#{subject.name}%").where(legislators: {last_name: "#{self.last_name}"}, positions: {vote_position: "No"})
      legis_category_total += Position.joins(:legislator, vote: {bill: :subjects}).where("subjects.name LIKE ?", "%#{subject.name}%").where(legislators: {last_name: "#{self.last_name}"})
    end #end of loop
    category_percent_yes = legis_category_yes.uniq{|position| position.id}.count.to_f / legis_category_total.uniq{|position| position.id}.count.to_f
    category_percent_no = legis_category_no.uniq{|position| position.id}.count.to_f / legis_category_total.uniq{|position| position.id}.count.to_f
     {yes: category_percent_yes, no:category_percent_no}
  end #end of method

end #end of class
