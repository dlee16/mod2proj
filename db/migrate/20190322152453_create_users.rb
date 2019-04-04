class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :address_1
      t.string :state
      t.string :city
      t.integer :zipcode
      t.integer :phone

      t.timestamps
    end
  end
end
