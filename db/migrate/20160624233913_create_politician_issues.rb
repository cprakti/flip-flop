class CreatePoliticianIssues < ActiveRecord::Migration
  def change
    create_table :politician_issues do |t|

      t.timestamps null: false
    end
  end
end
