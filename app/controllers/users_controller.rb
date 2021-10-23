class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :ensure_correct_user, except: [:top]
  before_action :calulate_exp, only: [:index]

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

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] ="ご利用ありがとうございました。"
    redirect_to top_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def ensure_correct_user
    @user = current_user
  end

  def calulate_exp
    @character = current_user.characters.find_by(user_id: current_user.id)
    @need_exp = LevelSetting.find_by(level: @character.level)
    @need_exp_for_next_level = @need_exp.needed_exp - @character.exp
  end
end
