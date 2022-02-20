class AddOrderProductsCountToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :order_products_count, :integer
  end
end
