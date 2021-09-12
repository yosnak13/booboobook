class CharacterSelectsController < ApplicationController

  def new
    @character = Character.new
    @pork = Pork.find(1)
  end

  def create
    @character = current_user.characters.build(character_params)
    @character.user_id = current_user.id
    binding.pry
    if @character.save
      flash.now[:notice] = "読書をして#{@character.name}を育ててみましょう"
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(
      :name, :character_type, :level, :exp, :description, :photo, :user_id)
  end
end
