class FlightsController < ApplicationController

  def index
    if params[:flight][:date] == "" || params[:flight][:return_date] == ""
      flash[:search_error] = "Please enter a valid date"
      redirect_to new_search_path
    else
      @flights = Flight.find_flights(params[:flight][:state], params[:flight][:destination_state], params[:flight][:date],params[:flight][:return_date])
    end
  end

  def new_search
    @new_flight= Flight.new
    render :new
  end

  def show
    @flight = Flight.find(params[:id])
    render :show
  end

end
