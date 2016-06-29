class Bill < ActiveRecord::Base
  has_many :votes
  has_many :bills_subjects
  has_many :subjects, through: :bills_subjects

  validates :bill, :congress, presence: true
  validates :bill, uniqueness: true
end
