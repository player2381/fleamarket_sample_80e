class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user, forign_key: true
      t.references :customer, forign_key: true
      t.timestamps
    end
  end
end
