class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.decimal :price, precision: 5, scale: 2
      t.integer :preparation_time

      t.timestamps
    end
  end
end
