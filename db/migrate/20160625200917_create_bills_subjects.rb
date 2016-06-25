class CreateBillsSubjects < ActiveRecord::Migration
  def change
    create_table :bills_subjects do |t|
      t.references :bill
      t.references :subject

      t.timestamps null: false
    end
  end
end
