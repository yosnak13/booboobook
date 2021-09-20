class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end  
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = book.find(params[:id])
    @book.destroy

    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:book_name)
  end
end