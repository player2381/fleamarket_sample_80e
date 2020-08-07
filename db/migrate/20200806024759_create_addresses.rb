class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_first_name, null: false
      t.string :address_family_name, null: false
      t.string :address_first_name_kana, null: false
      t.string :address_family_name_kana, null: false
      t.integer :post_code, null: false
      t.integer :prefecture_code, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.string :phone_number, null: false, unique: true
      t.string :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
