class SessionsController < ApplicationController

  def landing
    if current_user
      redirect_to "/dashboard"
    else
      @user = User.new
    end
  end

  def oauth
    user = User.new.tap do |u|
       u.from_social = true
       u.email = request.env['omniauth.auth']['info']['email']
       u.save
    end
    if user.save
      session[:user_id] = user.id
      session[:image] = request.env['omniauth.auth']['info']['image']
      redirect_to root_path
    else
      flash[:alert] = 'failure test'
      @user = User.new
      render :'sessions/landing'
    end
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

  def failure
  end



end
