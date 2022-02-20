class Admin::EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update toggle]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    meth = params[:employee][:password].blank? ? "update_without_password" : "update"

    respond_to do |format|
      if @employee.send(meth, employee_params)
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
      else
        format.js
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @employee.active? ? @employee.inactive! : @employee.active!
    redirect_to employee_url(@employee, subdomain: request.subdomain)
  end

private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :kind, :status, :email, :password, :password_confirmation)
    end

end