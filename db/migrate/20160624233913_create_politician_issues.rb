class CreatePoliticianIssues < ActiveRecord::Migration
  def change
    create_table :politician_issues do |t|
      t.references :politician
      t.references :issue

      t.timestamps null: false
    end
  end
end
