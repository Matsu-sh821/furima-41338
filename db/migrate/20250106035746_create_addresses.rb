class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :purchase,      null: false, foreign_key: true
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :block_number,  null: false
      t.string     :apartment_name
      t.string     :phone_number,  null: false
      t.timestamps
    end
  end
end
