class Legislator < ActiveRecord::Base

  has_many :positions, foreign_key: 'bioguide_id', primary_key: 'bioguide_id'

end
