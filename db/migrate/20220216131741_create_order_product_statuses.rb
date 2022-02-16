class CreateOrderProductStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :order_product_statuses do |t|
      t.integer :name, default: 1
      t.references :employee, null: false, foreign_key: true
      t.references :order_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
