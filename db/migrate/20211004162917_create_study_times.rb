class CreateStudyTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :study_times do |t|
      t.references :book,       foreign_key: true, null: false
      t.time :study_date,       null: false
      t.integer :study_time,    null: false

      t.timestamps
    end
  end
end
