class StudyTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_book
  before_action :current_character

  def new
    @study_time = @book.study_time.new
  end

  def create
    @study_time = @book.study_time.create(study_times_params)
    if @study_time.save
      @book.increment(:total_read_time, @study_time.study_time)
      @book.save

      @character.increment(:exp, @study_time.study_time)
      levelSetting = LevelSetting.find_by(level: @character.level)
      @character.level += 1 if @character.exp >= levelSetting.needed_exp

      while (levelSetting.needed_exp <= @character.exp) do
        levelSetting = LevelSetting.find_by(level: @character.level)
        @character.level += 1 if @character.exp >= levelSetting.needed_exp
        levelSetting = LevelSetting.find_by(level: @character.level)
        break if levelSetting.needed_exp > @character.exp
      end

      @character.update(level: @character.level)
      @character.save

      flash[:notice] = "学習時間を記録しました！"
      redirect_to users_path(current_user)
    else
      flash[:danger] = "入力をやり直してください"
      render :new
    end
  end

  private

  def current_book
    @book = current_user.books.find_by(status: "読書中")
    # if @book = nil
    #   @book = current_user.books.first
    #   @book.update(status: "読書中")
    #   @book.save
    #   flash[:danger] = "読書中の書籍が見当たらないため、最初の書籍を「読書中」に変更します"
    # end
  end

  def current_character
    @character = current_user.characters.find_by(user_id: current_user.id)
  end

  def study_times_params
    params.require(:study_time).permit(:study_date, :study_time, :book_id)
  end
end
