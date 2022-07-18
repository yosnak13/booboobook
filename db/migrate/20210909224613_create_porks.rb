class CreatePorks < ActiveRecord::Migration[5.2]
  def change
    create_table :porks do |t|
      t.string :name, null: false, default: ""
      t.text :description
      t.string :photo
      t.integer :evolution_level
      t.string :evolve_into

      t.timestamps
    end
  end
end
