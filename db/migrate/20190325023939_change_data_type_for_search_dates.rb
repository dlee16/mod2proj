class ChangeDataTypeForSearchDates < ActiveRecord::Migration[5.2]
  def change
    change_column(:searches, :departure_date, :date)
    change_column(:searches, :return_date, :date)
  end
end
