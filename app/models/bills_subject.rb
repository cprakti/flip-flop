class BillsSubject < ActiveRecord::Base

  belongs_to :vote
  belongs_to :subject


end
