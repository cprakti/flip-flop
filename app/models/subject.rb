class Subject < ActiveRecord::Base
  has_many :positions_subjects
  has_many :positions, through: :positions_subjects
end
