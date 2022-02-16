class OrderProductStatus < ApplicationRecord
  belongs_to :employee
  belongs_to :order_product

  validates_presence_of :name, :employee_id, :order_product_id

  enum status: { wait: 1, preparation: 2, completed: 3, cancelled: 4 }
end
