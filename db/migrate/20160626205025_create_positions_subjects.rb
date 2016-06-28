class CreatePositionsSubjects < ActiveRecord::Migration
  def change
    create_table :positions_subjects do |t|
      t.references :position, null: false, index: true
      t.references :subject, null: false, index: true

      t.timestamps null: false
    end
  end
end
