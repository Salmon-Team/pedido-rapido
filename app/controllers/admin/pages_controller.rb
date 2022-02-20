class Admin::PagesController < ApplicationController
  skip_before_action :authenticate_employee!, only: :home
  
  def home
  end

  def dashboard
  end
end
