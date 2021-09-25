class CreateReadingBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_books do |t|
      t.references :book,     foreign_key: true
      t.integer :read_time,   null: false
      t.date :date,           null: false

      t.timestamps
    end
  end
end
