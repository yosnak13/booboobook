# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(user)
    if current_user.characters.presence == nil
      user_first_registration_path(user)
    else
      users_path(user)
    end
  end

  def after_sign_out_path_for(user)
    root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(
      :sign_in, keys: [:email, :name, :password, :password_confirmation]
    )
  end

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:notice] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:notice] = "必須項目を入力してください。"
    end
  end
end
