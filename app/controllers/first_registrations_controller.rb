class FirstRegistrationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @first_registration = FirstRegistration.new
    @pork = Pork.find(1)
  end

  def create
    @first_registration = FirstRegistration.new(first_params)
    @first_registration.save
    flash.now[:notice] = "書籍を登録しました！！読書をしてぶたさんを育ててみましょう"
    redirect_to users_path(@user)
  end

  private

  def first_params
    params.require(:first_registration).permit(
      :name, :character_type, :level, :exp, :description, :photo, :user_id,
      :book_name, :status
    )
  end
end
