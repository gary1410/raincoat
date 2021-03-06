class UsersController < ApplicationController

include SessionHelper
include ForecastHelper

  def index
    @user = User.new
    if signed_in?
      forecast = get_current_forecast(current_user.latitude, current_user.longitude)
      render :index, locals: { :forecast => forecast }
    end
  end

  def create
    user = User.new(params[:user])
    if user.save
      UserMailer.signup_confirmation(user).deliver
      forecast = get_current_forecast(user.latitude, user.longitude)
      session[:current_user_id] = user.id
      render :json => { :name => render_to_string( :partial => "ajaxhome", locals: { :user => user, :current_weather => current_weather(forecast), :daily_weather => daily_weather(forecast) }),
                        :logout => render_to_string( :partial => "logout") }
    else
      render :json => { :error => user.errors.full_messages.join(", ")}, :status => :unprocessable_entity
    end
  end

end