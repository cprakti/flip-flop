class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :name, null: false
      t.string :tweets, null: false
      t.string :party, null: false

      t.timestamps null: false
    end
  end
end

