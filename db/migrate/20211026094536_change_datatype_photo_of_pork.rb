class ChangeDatatypePhotoOfPork < ActiveRecord::Migration[5.2]
  def up
    change_column :porks, :photo, :string
  end
end
