class ResetAllOrderProductCacheCounters < ActiveRecord::Migration[6.0]
  def change
    Product.all.each do |p|
      Product.reset_counters(p.id, :order_products)
    end
  end
end
