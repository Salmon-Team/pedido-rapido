class Product < ApplicationRecord
  belongs_to :category
  validates_presence_of :name, :category_id, :preparation_time
  validates :price, numericality: { other_than: 0 }
end
