class AddPhotoToPoliticians < ActiveRecord::Migration
  def change
    add_column :politicians, :avatar, :string
  end
end
