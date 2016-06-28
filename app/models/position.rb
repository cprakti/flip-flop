class Position < ActiveRecord::Base
  belongs_to :vote
  belongs_to :legislator, foreign_key: 'bioguide_id', primary_key: 'bioguide_id'
  has_many :positions_subjects
  has_many :subjects, through: :positions_subjects

  validates :vote, :bioguide_id, :vote_position, presence: true

end
