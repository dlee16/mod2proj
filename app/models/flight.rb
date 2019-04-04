class Flight < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews

  validates :state, :destination_state, :date, :return_date, presence: true
  validate :select_state


  def select_state
    @flights = Flight.all
    @flights.each do |flight|
      if flight.date.length == 0
        errors.add(:date, "Select a date")
      end
    end
  end

  def self.find_flights(state, destination_state, date, return_date)
    flights = Flight.order(:id)
    flights = flights.where("state is ?", "#{state}")
    flights = flights.where("destination_state is ?", "#{destination_state}")
    flights = flights.where("date is ?", date)
    flights = flights.where("return_date is?", return_date)
    flights
  end

  def self.status
    if return_date > Date.today
      false
    else
      true
    end
  end

end
