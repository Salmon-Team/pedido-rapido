class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :order_product_statuses, dependent: :destroy
  has_one :category, through: :product
  has_one :employee, :through => :order

  validates_presence_of :quantity

  after_create :create_first_order_product_status 
  
  delegate :name, to: "order_product_statuses.last", allow_nil: true, prefix: :status
  delegate :name, :price, to: :product, allow_nil: true, prefix: :product

  private

  def create_first_order_product_status
    order_product_statuses.create(employee_id: employee.id)
  end
end


