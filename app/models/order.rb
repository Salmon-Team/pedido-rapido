class Order < ApplicationRecord
  belongs_to :employee
  has_many :order_products
  has_many :payments
  validates_presence_of :table_number, :client_name, :employee_id
end
