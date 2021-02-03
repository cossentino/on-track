class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :place
      t.float :total
      t.string :note
      t.integer :category_id
      t.integer :user_id
      t.date :purchase_date

      t.timestamps
    end
  end
end
