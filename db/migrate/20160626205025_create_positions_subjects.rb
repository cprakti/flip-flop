class CreatePositionsSubjects < ActiveRecord::Migration
  def change
    create_table :positions_subjects do |t|
      t.references :position
      t.references :subject

      t.timestamps null: false
    end
  end
end
