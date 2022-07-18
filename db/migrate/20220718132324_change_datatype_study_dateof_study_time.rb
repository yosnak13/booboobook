class ChangeDatatypeStudyDateofStudyTime < ActiveRecord::Migration[5.2]
  def change
    change_column :study_times, :study_date, :date
  end
end
