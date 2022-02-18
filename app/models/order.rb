class Order < ApplicationRecord
  belongs_to :employee
  has_many :payments

  has_many :order_products,  dependent: :destroy
  accepts_nested_attributes_for :order_products, reject_if: proc { |attr| attr['quantity'].blank? }
  
  validates_presence_of :table_number, :client_name, :employee_id
end
