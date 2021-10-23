class Book < ApplicationRecord
  belongs_to :user
  has_many :study_time, dependent: :destroy
  validates :book_name, presence: true
  enum status:{ 未読: 0, 読書中: 1, 読了: 2 }
end
