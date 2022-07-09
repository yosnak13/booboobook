class StudyTime < ApplicationRecord
  belongs_to :book
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :book_id
    validates :study_time
    validates :study_date
  end
end
