class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name,             null: false, default: ""
      t.integer :character_type,  null: false
      t.integer :level,           null: false, default: 1
      t.integer :exp,             null: false, default: 0
      t.text :description
      t.binary :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
