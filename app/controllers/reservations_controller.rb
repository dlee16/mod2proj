class ReservationsController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    if current_user == nil
      flash[:notice1] = "You must be logged in."
      redirect_to login_path
    else
    @reservations = current_user.reservations
  end
  end

  def create
    @reservation = Reservation.create(flight_id: params[:flight_id], user_id: current_user.id)
      if @reservation.valid?
        redirect_to flight_path(@reservation.flight_id)
      else
        flash[:error] = @reservation.errors.full_messages
        redirect_to new_search_path
      end
  end
end
