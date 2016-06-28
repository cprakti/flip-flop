class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :congress, null: false
      t.string :bill, null: false, index: true
      t.string :title
      t.string :sponsor
      t.string :sponsor_id
      t.string :introduced_date
      t.string :cosponsors
      t.string :committees
      t.string :latest_major_action_date
      t.string :latest_major_action

      t.timestamps null: false
    end
  end
end
