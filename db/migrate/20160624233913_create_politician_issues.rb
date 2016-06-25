class CreatePoliticianIssues < ActiveRecord::Migration
  def change
    create_table :politician_issues do |t|
      t.references :politician_id, null: false
      t.references :issue_id, null: false

      t.timestamps null: false
    end
  end
end
