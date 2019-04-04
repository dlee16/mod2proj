class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:email] = @user.email
      redirect_to @user
    else
      flash[:notice] = 'Invalid email or password'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:email)
    flash[:notice] = "You have been logged out. Come back again!"
    redirect_to welcome_path
  end
end
