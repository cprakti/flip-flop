class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.references :politician
      t.references :issue

      t.timestamps null: false
    end
  end
end
