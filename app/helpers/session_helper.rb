module SessionHelper

  def logout
    session.clear
  end

  def current_user
    User.find(session[:current_user_id]) if signed_in?
  end

  def signed_in?
    session[:current_user_id] ? true : false
  end

end
