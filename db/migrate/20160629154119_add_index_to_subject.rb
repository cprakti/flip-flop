class AddIndexToSubject < ActiveRecord::Migration
  def change
    add_index :subjects, :category_id
  end
end
