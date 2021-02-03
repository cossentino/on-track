class WelcomeController < ApplicationController
  def landing
    # if logged_in?
    #   redirect_to "/users/#{session[:user_id]}/dashboard"
    # else
    @user = User.new
    # end
  end
end
