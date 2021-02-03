class SessionsController < ApplicationController

  def landing
    if current_user
      redirect_to "/users/#{session[:user_id]}/dashboard"
    else
      @user = User.new
    end
  end

  def oauth
    # binding.pry

    # capture email and image from google
    session[:email] = request.env['omniauth.auth']['info']['email']
    session[:image] = request.env['omniauth.auth']['info']['image']

    # find or create by email

    user = User.find_or_create_by(email: session[:email], from_social: true)
    session[:user_id] = user.id
    # session[:omniauth_data] = request.env['omniauth.auth']
    # binding.pry
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
    reset_session
    redirect_to root_path
  end


end
