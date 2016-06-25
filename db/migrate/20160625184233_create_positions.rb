class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :vote
      t.string :bioguide_id
      t.string :vote_position

      t.timestamps null: false
    end
  end
end
