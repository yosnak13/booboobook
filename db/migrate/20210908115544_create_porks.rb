class CreatePorks < ActiveRecord::Migration[5.2]
  def change
    create_table :porks do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.binary :photo
      t.integer :evolution_level

      t.timestamps
    end
  end
end
