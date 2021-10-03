class CharacterSelectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_user, only: [:new, :show]

  def new
    @first_character = Character.new
    @pork = Pork.find(1)
  end

  def create
    @first_character = current_user.characters.build(character_params)
    if @first_character.save
      flash.now[:notice] = "読書をして#{@first_character.name}を育ててみましょう"
      redirect_to users_path(@user)
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
