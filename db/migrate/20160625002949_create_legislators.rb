class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|

      t.timestamps null: false
    end
  end
end
