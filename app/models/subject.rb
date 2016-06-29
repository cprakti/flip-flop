class Subject < ActiveRecord::Base
  has_many :bills_subjects
  has_many :bills, through: :bills_subjects
  belongs_to :category

  validates :name, presence: true, uniqueness: true
end
