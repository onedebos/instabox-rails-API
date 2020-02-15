class AddLikedToPictures < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :liked, :boolean
  end
end
