class ChangeDatatypePhotoOfCharacters < ActiveRecord::Migration[5.2]
  def change
    change_column :characters, :photo, :string
  end
end
