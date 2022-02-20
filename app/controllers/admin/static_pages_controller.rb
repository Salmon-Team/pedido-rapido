class Admin::StaticPagesController < ApplicationController
  skip_before_action :authenticate_employee!, only: :home
  
  def home
  end
end
