class CharactersController < ApplicationController
  before_action :find_character, only: [:show]

  def index
    @pork = Pork.all
  end

  def new
    @characters = Character.new
  end

  def create
    @pork.create_users_pork
    @character = current_user.Character.create(character_params)
    if @character.save
      redirect_to root_path
    else
      render root_path
    end
  end

  def show
    # @character = current_user.characters.find(1)
  end

  def edit
  end

  def update
  end

  private

  def character_params
    params.require(:characters).permit(
      :name, :character_type, :level, :exp, :description, :photo)
  end

  def find_character
    @user = current_user
    @character = @user.characters
  end
end
