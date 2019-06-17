class AddDonationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :donation, :has_many
  end
end
