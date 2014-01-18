class SessionsController < ApplicationController
  include SessionHelper

  def destroy
    logout
    redirect_to root_path
  end
  
end