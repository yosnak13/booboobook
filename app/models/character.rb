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

  def increment_study_time_to_character_exp(character, study_time_params)
    posted_read_time = study_time_params.values[1].to_i
    binding.pry
    character.increment(:exp, posted_read_time)
    character.save
  end
end
