class Character < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  with_options presence:true do
    validates :name
    validates :character_type
    validates :level, numericality: true
    validates :exp, numericality: true
    validates :description, format: {with:/\A[ぁ-んァ-ン一-龥]/}
  end

  def increment_character_exp(character, study_time_params)
    posted_read_time = study_time_params.values[1].to_i
    character.increment(:exp, posted_read_time)
    character.save
  end

  def level_up(character)
    levelSetting = LevelSetting.find_by(level: character.level)
    character.level += 1 if character.exp >= levelSetting.needed_exp
    while (levelSetting.needed_exp <= character.exp) do
      levelSetting = LevelSetting.find_by(level: character.level)
      character.level += 1 if character.exp >= levelSetting.needed_exp
      levelSetting = LevelSetting.find_by(level: character.level)
      break if levelSetting.needed_exp > character.exp
    end
    character.update(level: character.level)
    character.save
  end

  def evolution_character(character)
    current_pork = Pork.find_by(name: character.name)
    # if character.level >= current_pork.evolution_level
      next_pork = Pork.find_by(name: current_pork.evolve_into)
      unless next_pork == nil
        binding.pry
        character.update(
          name: current_pork.evolve_into,
          description: next_pork.description,
          photo: ActiveStorage::Blob.create_after_upload!(
            io: File.open("./db/fixtures/#{next_pork.photo.filename}"),
            filename: "#{next_pork.photo.filename}"
          )
        )
        character.save
      end
    # end
  end
end
