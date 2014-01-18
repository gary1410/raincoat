class SessionsController < ApplicationController
  include SessionHelper

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path, flash: {error: 'Email or Password is not Found'}
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end