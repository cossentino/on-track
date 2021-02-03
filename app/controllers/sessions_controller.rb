class SessionsController < ApplicationController


  def create
    binding.pry
    # We're going to save the authentication information in the session
    # for demonstration purposes. We want to keep this data somewhere so that,
    # after redirect, we have access to the returned data
    session[:email] = request.env['omniauth.auth']['info']['email']
    session[:image] = request.env['omniauth.auth']['info']['image']
    # session[:omniauth_data] = request.env['omniauth.auth']
    # binding.pry

    # Ye olde redirect
    redirect_to root_path
  end


  def login
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:alert] = 'failure test'
      @user = User.new
      render :'welcome/landing'
    end
  end


  def logout
    session.clear
    redirect_to root_path
  end


end
