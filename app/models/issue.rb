class Issue < ActiveRecord::Base
  has_many :interests
  has_many :politicians, through: :interests

  validates :name, :keywords, presence: true



end
