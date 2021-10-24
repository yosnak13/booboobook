class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_user

  def index
    # 10ページごとにページネーション
    @books = current_user.books.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:notice] = "書籍登録が完了しました"
      redirect_to user_books_path
    else
      render :new
    end  
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to user_books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "書籍変更が完了しました"
      redirect_to user_book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_books_path
  end

  private
  
  def book_params
    params.require(:book).permit(:book_name, :status, :memo)
  end

  def find_current_user
    @user = current_user
  end

  def find_book
    @user = current_user
    @book = @user.books
  end
end