class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => { :name => render_to_string( :partial => "ajaxhome", locals: { :user => user }) }
    else
      redirect_to root_path
    end
  end

end
