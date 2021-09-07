class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :character_type
      t.integer :level
      t.integer :exp
      t.text :description
      t.binary :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
