class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :isbn
      t.string :book_name
      t.integer :total_read_time
      t.integer :status
      t.string :memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
