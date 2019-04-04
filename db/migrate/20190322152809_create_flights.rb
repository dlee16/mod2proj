class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :airline
      t.datetime :date
      t.string :city
      t.string :state
      t.integer :price


      t.timestamps
    end
  end
end
