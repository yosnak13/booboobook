require 'net/http'
require 'uri'
require 'json'
require 'httparty'

class BooksController < ApplicationController
  include BooksApi
  before_action :authenticate_user!
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :check_book_flag, only: [:select_book]
  # after_action :xxxxx, only: [:change_book]

  def index
    # 10ページごとにページネーション
    @books = current_user.books.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @book = current_user.books.find(params[:id])
  end

  def new
    @results = []
    if @results.present?
      @book = Book.new
    else
      @book = Book.new
      @results = url_from_keyword
    end
  end

  def url_from_keyword
    keyword = params[:keyword]
    BooksApi.get_url(keyword)
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
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "書籍変更が完了しました"
      redirect_to user_book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if @book.status == "読書中"
      flash[:notice] = "読書中の書籍は削除できません"
      render :show
    else
      @book.destroy
      redirect_to user_books_path
    end
  end

  def select_book
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

  def find_book
    @book = Book.find(params[:id])
  end

  def check_book_flag
    @book = current_user.books.find_by(status: 1)
    @books = current_user.books.where(status: 0).
      or(current_user.books.where(status: 2))
  end

  def change_book_status_params
    params.require(:book).permit(:status)
  end
end
