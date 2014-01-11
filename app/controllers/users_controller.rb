class UsersController < ApplicationController

include ForecastHelper

  def index
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      current_temp = get_current_forecast(user.latitude, user.longitude).currently.apparentTemperature
      render :json => { :name => render_to_string( :partial => "ajaxhome", locals: { :user => user, :current_temp => current_temp }) }
    else
      redirect_to root_path
    end
  end

end
