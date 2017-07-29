class CustomersController < ApplicationController
  before_action :authenticate_user!
  layout 'backend'
  def index
    @tickets = @user.tickets
  end
end
