class UsersController < ApplicationController

include ForecastHelper

  def index
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      forecast = get_current_forecast(user.latitude, user.longitude)
      render :json => { :name => render_to_string( :partial => "ajaxhome", locals: { :user => user, :current_weather => current_weather(forecast), :daily_weather => daily_weather(forecast) }) }
    else
      redirect_to root_path
    end
  end

end
