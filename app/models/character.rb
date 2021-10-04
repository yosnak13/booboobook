class Character < ApplicationRecord
  belongs_to :user
  has_many :study_time
  has_many :books, through: :study_times
end
