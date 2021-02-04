class SessionsController < ApplicationController

  def landing
    if current_user
      redirect_to "/dashboard"
    else
      @user = User.new
    end
  end

  def login
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
    else
      flash[:alert] = 'failure test'
      @user = User.new
      render :'welcome/landing'
    end
  end

  def signup
    @user = User.new
  end

  def oauth
    binding.pry
    oauth_email = request.env['omniauth.auth']['info']['email']
    ## if user exists in database, ensure that it is also from social
    if user = User.find_by(email: oauth_email)
      if user.from_social != true
        flash[:alert] = 'Email is already associated with an account. Please try again'
        redirect_to root_path
      else
        login_from_social(user)
      end
    ## if not duplicate and not existing social user, create user from social
    else
      create_from_social
    end
  end


  def logout
    reset_session
    redirect_to root_path
  end

  def failure
  end

  private


    def login_from_social(user)
      session[:user_id] = user.id
      session[:image] = request.env['omniauth.auth']['info']['image']
      redirect_to root_path
    end

    def create_from_social
      user = User.new.tap do |u|
        u.from_social = true
        u.email = request.env['omniauth.auth']['info']['email']
        u.first_name = request.env['omniauth.auth']['info']['first_name']
        u.last_name = request.env['omniauth.auth']['info']['last_name']
      end
      if user.save
        login_from_social(user)
        redirect_to root_path
      else
        flash[:alert] = 'Unable to create Account. Please try again'
        redirect_to '/'
      end
    end



end
