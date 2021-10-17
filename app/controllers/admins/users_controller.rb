class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all.order(id: "ASC")
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_index_path
  end
end
