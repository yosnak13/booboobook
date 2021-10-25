class ChangeTotalReadTimeOfBooks < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :total_read_time, :integer, default: 0, null: false
  end

  def down
    change_column :books, :total_read_time, :integer
  end
end
