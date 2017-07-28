class HomeController < ApplicationController
  def index
    if user_signed_in?
      print "You have been logged in as #{current_user.role}"
    end
  end
end
