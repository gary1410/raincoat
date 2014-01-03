class UsersController < ApplicationController

  def index
  end

  def create
    user = User.create(params[:user])
    redirect_to root_path
  end
  
end