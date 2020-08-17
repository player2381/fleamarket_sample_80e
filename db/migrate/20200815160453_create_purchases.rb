class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :user, forign_key: true
      t.references :production, forign_key: true
      
      t.timestamps
    end
  end
end
