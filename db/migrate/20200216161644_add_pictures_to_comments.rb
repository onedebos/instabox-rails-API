class AddPicturesToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :picture, null: false, foreign_key: true
  end
end
