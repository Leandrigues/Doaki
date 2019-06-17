class AddUserToDonation < ActiveRecord::Migration[5.2]
  def change
    add_reference :donations, :user, foreign_key: true
  end
end
