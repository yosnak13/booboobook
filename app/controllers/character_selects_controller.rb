class CharacterSelectsController < ApplicationController

  def new
    @character = Character.new
  end

  def create
    @character = current_user.Character.create(character_params)
    if @character.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def character_params
    params.require(:characters).permit(
      :name, :character_type, :level, :exp, :description, :photo)
  end
end
