class Cook::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = current_employee.orders.new
    @products = Product.joins(:category).all.order("categories.title ASC")
    @products.each do |product|
      @order.order_products.new(product_id: product.id)
    end
  end

  def edit
  end

  def create
    @order = current_employee.orders.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order, subdomain: request.subdomain), notice: "Order was successfully created." }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order, subdomain: request.subdomain), notice: "Order was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url(subdomain: request.subdomain), notice: "Order was successfully destroyed." }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:client_name, :table_number, :employee_id, order_products_attributes: [:id, :quantity, :product_id])
    end
end
