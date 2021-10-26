class CharactersController < ApplicationController
  def index
    @pork = Pork.all
    @character = current_user.characters.all
  end

  def new
  end

  def create
  end

  def show
    @pork.find(params[:id])
  end

  def edit
  end

  def update
  end
end
