class ChangeStatusOfBooks < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :status, :integer, default: 0, null: false
  end

  def down
    change_column :books, :status, :integer
  end
end
