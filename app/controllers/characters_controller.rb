class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit]
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
    @current_exp = @character.exp
    if @character.update(post_params)
      @character.increment(:exp, @current_exp)
      @character.save
      # @character.level_up
      flash.now[:notice] = "学習時間を登録しました！"
      redirect_to users_path(current_user)
    else
      flash.now[:notice] = "入力をやり直してください"
      render :edit
    end
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
