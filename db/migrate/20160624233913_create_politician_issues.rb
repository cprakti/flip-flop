class CreatePoliticianIssues < ActiveRecord::Migration
  def change
    create_table :politician_issues do |t|
      t.references :politician, null: false
      t.references :issue, null: false

      t.timestamps null: false
    end
  end
end
