class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name, null: false
      t.text  :text, null: false
      t.integer  :price, null: false
      t.integer :category_id, foreign_key: true
      t.integer :status_id, foreign_key: true
      t.integer :delivery_fee_id, foreign_key: true
      t.integer :option_id, foreign_key: true
      t.integer :shipping_day_id, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
