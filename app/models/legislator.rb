class Legislator < ActiveRecord::Base

  has_many :positions, foreign_key: 'bioguide_id', primary_key: 'bioguide_id'

  validates :bioguide_id, :chamber, presence: true


  def issue_positions(subject_array)
    legis_issue_yes = []
    legis_issue_no = []
    legis_issue_total = []
    subject_array.each do |subject|
      legis_issue_yes += Position.joins(:legislator, vote: {bill: :subjects}).where("subjects.name LIKE ?", "%#{subject}%").where(legislators: {last_name: self.last_name}, positions: {vote_position: "Yes"})
      legis_issue_no += Position.joins(:legislator, vote: {bill: :subjects}).where("subjects.name LIKE ?", "%#{subject}%").where(legislators: {last_name: "#{self.last_name}"}, positions: {vote_position: "No"})
      legis_issue_total += Position.joins(:legislator, vote: {bill: :subjects}).where("subjects.name LIKE ?", "%#{subject}%").where(legislators: {last_name: "#{self.last_name}"})
    end #end of loop
    issue_percent_yes = legis_issue_yes.uniq{|position| position.id}.count.to_f / legis_issue_total.uniq{|position| position.id}.count.to_f
    issue_percent_no = legis_issue_no.uniq{|position| position.id}.count.to_f/ legis_issue_total.uniq{|position| position.id}.count.to_f
     {yes: issue_percent_yes, no:issue_percent_no}
  end #end of method

end #end of class
