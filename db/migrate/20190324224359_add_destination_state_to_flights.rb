class AddDestinationStateToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :destination_state, :string
  end
end
