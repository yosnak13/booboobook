class StudyTime < ApplicationRecord
  belongs_to :book
  belongs_to :user

  with_options presence: true do
    validates :study_time
    validates :study_date
  end
end
