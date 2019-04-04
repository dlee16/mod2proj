class ApplicationController < ActionController::Base
before_action :authorized
helper_method :current_user

  def current_user
      User.find_by({ email: session[:email] })
  end

  def logged_in?
    !!current_user
  end

  def authorized
    flash[:notice] = "SIGN IN!"
    redirect_to login_path unless logged_in?
  end

end
