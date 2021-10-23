class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit]
  before_action :find_character, only: [:index, :show, :edit, :update]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def set_book
    @book = current_user.books.first
  end

  def character_params
    params.require(:characters).permit(
      :name, :character_type, :level, :exp, :description, :photo
    )
  end

  def post_params
    params.require(:character).permit(:exp)
    # params.require(:book).permit(:total_read_time)
  end

  def find_character
    @character = current_user.characters.first
  end
end
