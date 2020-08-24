class CreateProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :productions do |t|
      t.references :user, forign_key: true
      t.string :name, null: false
      t.integer :category_id, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.references :purchaser, forign_key: true
      t.string :size, null: false
      t.string :shipping_charge, null: false
      t.string :prefecture_code, null: false
      t.string :detail_date, null: false
      t.string :trading_status, null: false
      t.timestamps
    end
  end
end
