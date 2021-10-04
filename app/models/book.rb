class Book < ApplicationRecord
  belongs_to :user
  has_many :study_time
  has_many :characters, through: :study_times
end
