class Subject < ActiveRecord::Base

  has_many :bills_issues
  has_many :bills, through: :bills_issues


end
