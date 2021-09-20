class Admins::UsersController < ApplicationController
  def index
    @users = User.all.order(id: "DESC")
  end
end
