class StudyTime < ApplicationRecord
  belongs_to :book

  with_options presence: true do
    validates :study_time
    validates :study_date
  end
end
