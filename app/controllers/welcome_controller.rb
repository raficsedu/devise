class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.role == "admin"
      redirect_to admin_root_path
    elsif current_user.role == "agent"
      redirect_to agent_root_path
    elsif current_user.role == "customer"
      redirect_to customer_root_path
    end
  end
end
