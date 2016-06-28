class Vote < ActiveRecord::Base
  belongs_to :bill
  has_many :positions

  validates :chamber, :congress, :session, :roll_call, :official_bill_id, presence: true

end
