class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_character, only: [:index, :show, :edit, :update]

  def index
  end

  def new
  end

  def create
    # @pork.create_users_pork
    # @character = current_user.Character.create(character_params)
    # if @character.save
    #   redirect_to root_path
    # else
    #   render root_path
    # end
  end

  def show
  end

  def edit
  end

  def update
    @current_exp = @character.character_exp
    if @character.update(post_params)
      @character.increment(:character_exp, @current_exp)
      @character.save
      @character.level_up
      redirect_to character_path
    else
      redirect_to edit_character_path
    end
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:characters).permit(
      :name, :character_type, :level, :exp, :description, :photo)
  end

  def find_character
    @user = current_user
    @character = @user.characters
    # @character = current_user.characters.find(params[:id])
  end
end
