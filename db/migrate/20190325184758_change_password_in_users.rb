class ChangePasswordInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column(:users, :password, :string)
    remove_column(:flights, :password_digest, :string)
  end
end
