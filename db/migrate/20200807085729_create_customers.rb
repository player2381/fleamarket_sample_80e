class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :user, forign_key: true
      t.timestamps
    end
  end
end