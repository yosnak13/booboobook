class StudyTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_character_and_book

  def new
    @study_time = StudyTime.new
  end

  def create
    book = @book
    character = @character
    @study_time = current_user.study_times.create(study_time_params)
    if @study_time.present?
      book.increment_total_read_time(book, study_time_params)
      character.increment_character_exp(character, study_time_params)
      character.level_up(character) if character.level < 60
      character.evolution_character(character)
      flash[:notice] = "学習時間を記録しました！"
      redirect_to users_path(current_user)
    else
      flash[:notice] = "入力内容に誤りがあります。"
      redirect_to  user_study_times_path(current_user)
    end
  end

  private

  def current_character_and_book
    @st = current_user.study_times.group(:created_at).sum(:study_time)
    @character = current_user.characters.find_by(user_id: current_user.id)
    @book = current_user.books.find_by(status: 1)
    if @book == nil
      redirect_to user_books_path(current_user)
      flash[:notice] = "読書したい書籍のステータスを「読書中」に設定してください。\
      読書中の書籍がなければ学習時間を記録できません。"
    end
  end

  def study_time_params
    params.require(:study_time).permit(:study_date, :study_time, :user_id, :book_id)
  end
end
