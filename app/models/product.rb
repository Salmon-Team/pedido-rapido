class Product < ApplicationRecord
  has_many :order_products
  belongs_to :category
  validates_presence_of :name, :category_id, :preparation_time
  validates :price, numericality: { other_than: 0 }
end
