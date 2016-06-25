class PoliticianIssue < ActiveRecord::Base
  belongs_to :politician
  belongs_to :issue

  validates :politician_id, :issue_id, presence: true

end
