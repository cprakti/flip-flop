class Subject < ActiveRecord::Base
  has_many :positions_subjects
  has_many :positions, through: :positions_subjects

  has_many :bills_subjects
  has_many :bills, through: :bills_subjects

  validates :name, presence: true, uniqueness: true

end
