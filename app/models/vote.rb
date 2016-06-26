class Vote < ActiveRecord::Base
  belongs_to :bill
  has_many :positions
end
