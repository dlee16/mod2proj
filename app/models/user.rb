class User < ApplicationRecord
  has_many :reservations
  has_many :flights, through: :reservations
  has_many :reviews

  validates :email, uniqueness: true
  validates :first_name,:last_name, :age, :email, :address_1, :city, :state, :zipcode, presence: true
  validates :phone, presence: true, length: {is: 10}

  has_secure_password

  def full_name
     self.first_name + " " + self.last_name
  end

  def number_of_flights_booked
    self.reservations.length
  end

  def member_since
    self.created_at.strftime("%B-%Y")
  end

  def avg_rating_per_airline

  end

  def avg_spending_on_flights
    if self.flights.length == 0
      "0"
    else
      my_flights = self.flights.map do |flight|
      flight.price
    end
      sum = my_flights.inject{|sum, n| sum + n }
      avg =(sum/my_flights.length)
  end
  end

end
