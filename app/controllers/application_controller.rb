class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    if session[:user_id]
      return User.find(session[:user_id]) 
    else
      return nil
    end
  end
  helper_method :current_user
  # before_action :verify_user
  private
  def verify_user
    if current_user
      return self
    else
      redirect_to login_path and return
    end
  end
end
