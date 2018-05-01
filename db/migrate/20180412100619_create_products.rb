class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :sale_tax
      t.float :import_tax

      t.timestamps
    end
  end
end
