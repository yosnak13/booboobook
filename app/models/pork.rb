class Pork < ApplicationRecord
  has_one_attached :photo

  with_options presence:true do
    validates :name
    validates :description
  end
end
