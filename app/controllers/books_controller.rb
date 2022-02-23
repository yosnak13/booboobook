require 'net/http'
require 'uri'
require 'json'
require 'httparty'

class BooksController < ApplicationController
  include BooksApi
  before_action :authenticate_user!
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :check_book_flag, only: [:select_book, :change_book]
  before_action :controll_status_1, only: :update
  after_action :update_status_into_2,  only: :update

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

  def url_from_keyword
    keyword = params[:keyword]
    BooksApi.get_url(keyword)
  end

  def select_book
  end

  def change_book
    binding.pry
    @sample = Book.find(params[:id])
    others = current_user.books.where(status: 0).or(current_user.books.where(status: 2))
    if @sample.update(change_book_status_params)
      flash[:notice] = "読書したい書籍が変更されました"
      @others.update_all_status(others)
      redirect_to user_study_times_path
    else
      flash[:notice] = "書籍が変更できませんでした"
      redirect_to user_study_times_path
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
    @current_book = current_user.books.find_by(status: 1)
    @other_books = current_user.books.where(status: 0).
      or(current_user.books.where(status: 2))
    @status_1 = "読書中"
  end

  def change_book_status_params
    params.require(:book).permit(:status)
  end

  def controll_status_1
    @last_status_1 = current_user.books.find_by(status: 1)
  end

  def update_status_into_2
    if @last_status_1.status == book_params[:status]
      @last_status_1.update(status: 2)
      @last_status_1.save
    end
  end
end
