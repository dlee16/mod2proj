class ReviewsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index

    if current_user == nil
      flash[:notice1] = "You must be logged in."
      redirect_to login_path
    else
    @reviews = current_user.reviews.sort.reverse
    render :index
    end
  end


  def new
    @review = Review.new
    flights = current_user.flights.select do |flight|
      flight.return_date < Date.today
    end
    @my_flights = flights.map do |flight|
      flight
    end
    render :new
  end

  def create
    @review = Review.create(user_id: current_user.id, flight_id: params[:review][:flight_id], rating: params[:review][:rating], content: params[:review][:content])
    if @review.valid?
      redirect_to reviews_path
    else
      flash[:error] = @review.errors.full_messages
      redirect_to new_flight_review_path(params[:review][:flight_id])
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  #refactor using review_params
  # private
  # def review_params
  #   params.require(:review).permit(:flight_id, :rating, :content)
  # end


end
