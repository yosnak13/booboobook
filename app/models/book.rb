class Book < ApplicationRecord
  belongs_to :user
  # userが本を削除した時過去の学習時間が現象する恐れがあるため、dependent: :destroyは未実装
  has_many :reading_books
end
