class Subject < ActiveRecord::Base
  has_many :positions_subjects
  has_many :positions, through: :positions_subjects
  has_many :

  validates :name, presence: true, uniqueness: true

end
