class Character < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  with_options presence:true do
    validates :name, format: {with:/\A[ァ-ヶー－]+\z/}
    validates :character_type
    validates :level, numericality: true
    validates :exp, numericality: true
    validates :description, format: {with:/\A[ぁ-んァ-ン一-龥]/}
  end
end
