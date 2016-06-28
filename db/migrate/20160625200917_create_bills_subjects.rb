class CreateBillsSubjects < ActiveRecord::Migration
  def change
    create_table :bills_subjects do |t|
      t.references :bill, null: false, index: true
      t.references :subject, null: false, index: true

      t.timestamps null: false
    end
  end
end
