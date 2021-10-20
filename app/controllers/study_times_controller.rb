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
      @character.increment(:exp, @study_time.study_time)

      levelSetting = LevelSetting.find_by(level: @character.level)
      if levelSetting.needed_exp <= @character.exp
        @character.level += 1
        @character.update(level: @character.level)
        @character.save
      else
        @character.save
      end

      @book.increment(:total_read_time, @study_time.study_time)
      @book.save
      flash.now[:notice] = "学習時間を記録しました！"
      redirect_to users_path(current_user)
    else
      flash.now[:danger] = "入力をやり直してください"
      render :new
    end
  end

  private

  def current_book
    @book = current_user.books.find_by(user_id: current_user.id)
  end

  def current_character
    @character = current_user.characters.find_by(user_id: current_user.id)
  end

  def study_times_params
    params.require(:study_time).permit(:study_date, :study_time, :book_id)
  end
end
