class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :vote, null: false
      t.string :bioguide_id, null: false, index: true
      t.string :vote_position, null: false, index: true

      t.timestamps null: false
    end
  end
end
