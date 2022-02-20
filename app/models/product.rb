class Product < ApplicationRecord
  has_many :order_products
  belongs_to :category
  
  validates_presence_of :name, :category_id, :preparation_time
  validates :price, numericality: { other_than: 0 }

  enum status: { active: 1, inactive: 2 }

  before_destroy :product_with_order?

private
  
  def product_with_order?
    return unless order_products_count > 0
    errors.add(:product, "Cannot delete product with orders") 
    throw(:abort)
  end
end

