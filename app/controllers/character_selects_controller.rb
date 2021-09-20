class CharacterSelectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_user, only: [:new, :show]

  def new
    @character = Character.new
    @pork = Pork.find(1)
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      flash.now[:notice] = "読書をして#{@character.name}を育ててみましょう"
      redirect_to user_character_path(@character) #変更必要
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(
      :name, :character_type, :level, :exp, :description, :photo, :user_id)
  end

  def find_current_user
    @user = current_user
  end
end
