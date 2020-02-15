class AddCaptionToPicture < ActiveRecord::Migration[6.0]
  def change
    add_column :pictures, :caption, :string
  end
end
