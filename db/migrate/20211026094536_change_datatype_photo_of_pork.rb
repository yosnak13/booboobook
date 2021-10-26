class ChangeDatatypePhotoOfPork < ActiveRecord::Migration[5.2]
  def change
    change_column :porks, :photo, :string
  end
end
