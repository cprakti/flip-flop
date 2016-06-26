class PositionsSubject < ActiveRecord::Base
  belongs_to :position
  belongs_to :subject
end
