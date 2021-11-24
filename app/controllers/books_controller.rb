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

  def select_book
    @book = current_user.books.find_by(status: 1)
    @books = current_user.books.where(status: 0).or(current_user.books.where(status: 2))
  end

  def change_book
    #postされた書籍を拾う
    @change_book_status = Book.find(params[:id])
    #読書中の書籍を拾う
    @edit_status_book = current_user.books.find_by(status: 1)
    binding.pry
    if @change_book_status.update(change_book_status_params)
      @change_book_status.save
      @edit_status_book.update(status: 2)
      @edit_status_book.save
      flash[:notice] = "読書する書籍を変更しました"
      redirect_to study_times_user_path(current_user)
    else
      flash[:alart] = "書籍を変更できませんでした"
      render :select_book
    end
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :status, :memo)
  end

  def find_current_user
    @user = current_user
  end

  def change_book_status_params
    params.require(:book).permit(:status)
  end
end
