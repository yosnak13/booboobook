class ChangeDatatypePhotoOfCharacters < ActiveRecord::Migration[5.2]
  def up
    change_column :characters, :photo, :string
  end
end
