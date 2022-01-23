class StudyTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_character

  def new
    @book = current_user.books.find_by(status: "読書中")
    @study_times = @book.study_times
    @study_time = @study_times.new
  end

  def create
    book = current_user.books.find_by(status: "読書中")
    character = @character

    study_time = book.study_times_new
    study_time.save_study_time(study_time, study_time_params)

    book.increment_study_time_to_book(book, study_time_params)
    character.increment_study_time_to_character_exp(character, study_time_params)

    character.level_up(character, study_time_params) if character.level < 60

    flash[:notice] = "学習時間を記録しました！"
    redirect_to users_path(current_user)
  end

  private

  def current_character
    @character = current_user.characters.find_by(user_id: current_user.id)
  end

  def study_time_params
    params.require(:study_time).permit(:study_date, :study_time, :book_id)
  end
end
