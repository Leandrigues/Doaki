class AddUserIdToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :user_id, :integer
  end
end
