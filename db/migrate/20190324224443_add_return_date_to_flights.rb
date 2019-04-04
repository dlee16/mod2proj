class AddReturnDateToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :return_date, :date
  end
end
