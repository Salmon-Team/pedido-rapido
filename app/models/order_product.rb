class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :order_product_statuses
  has_one :employee, :through => :order

  validates_presence_of :order_id, :product_id, :quantity

  after_create :create_first_order_product_status 
  
  delegate :name, to: "order_product_statuses.last", allow_nil: true, prefix: :status

  private

  def create_first_order_product_status
    order_product_statuses.create(employee_id: employee.id)
  end
end


