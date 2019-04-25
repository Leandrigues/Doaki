class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :title
      t.text :description
      t.string :street
      t.string :detail
      t.string :zip
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
