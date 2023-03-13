class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.references :buyer,          null: false, foreign_key: true
      t.string     :post_code,      null: false
      t.integer    :area_id,        null: false
      t.string     :city,           null: false
      t.string     :address_number, null: false
      t.string     :house_name
      t.string     :telephone,  null: false
      t.timestamps
    end
  end
end