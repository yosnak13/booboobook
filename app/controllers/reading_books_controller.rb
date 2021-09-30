class ReadingBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :current_book, only: [:new, :create]

  def new
    @reading_books = ReadingBook.new
  end

  def create
    @reading_books = @current_book.reading_books.build(reading_books_params)
    if @reading_books.save
      flash[:notice] = "学習時間を記録しました！"
      redirect_to users_path(current_user)
    else
      flash[:alart] = "入力内容に不備があります"
      render :new
    end
  end

  private

  def reading_books_params
    params.require(:reading_book).permit(:read_time, :date)
  end

  def current_book
    @current_book = Book.find(params[:user_id])
  end
end
