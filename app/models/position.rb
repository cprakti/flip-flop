class Position < ActiveRecord::Base
  belongs_to :vote
  belongs_to :legislator, foreign_key: 'bioguide_id', primary_key: 'bioguide_id'

  validates :vote, :bioguide_id, :vote_position, presence: true

end
