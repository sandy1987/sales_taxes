class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :item_name
      t.integer :quantity
      t.float :cost
      t.float :sale_tax
      t.float :import_tax

      t.timestamps
    end
  end
end
