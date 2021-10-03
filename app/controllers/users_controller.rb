class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_correct_user, except: [:top]

  def index
    @character = current_user.characters
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def top
  end

  def help
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def ensure_correct_user
    @user = current_user
  end
end
