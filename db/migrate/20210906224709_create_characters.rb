class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :character_type
      t.integer :level
      t.string :exp
      t.string :integer

      t.timestamps
    end
  end
end
