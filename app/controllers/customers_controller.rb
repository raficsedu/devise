class CustomersController < ApplicationController
  before_action :authenticate_user!
  layout 'backend'
  def index
    @user = current_user
  end
end
