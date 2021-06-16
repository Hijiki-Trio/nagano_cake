class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.string :customer_id
      t.string :name
      t.string :address
      t.string :postcode

      t.timestamps
    end
  end
end
