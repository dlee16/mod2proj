class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  skip_before_action :authorized, only: [:welcome, :new, :create]

  def welcome
    render :welcome
  end

  def new
   @user = User.new
   render :new
  end

  def create
   @user = User.create(user_params)
   if @user.valid?
     session[:email] = @user.email
     redirect_to @user
   else
     @error = @user.errors.full_messages
     render :new
   end
  end

  def show
    @my_reviews = current_user.reviews
   render :show
  end

  def edit
   render :edit
  end

  def update
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = 'Your account has been deleted.'
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :address_1, :city, :state, :zipcode, :phone, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
