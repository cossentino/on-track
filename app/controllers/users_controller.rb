class UsersController < ApplicationController

    def dashboard
      @user = current_user
      @purchases = Purchase.find_by(user_id: current_user.id)
      view_or_redirect(:dashboard, :'/sessions/landing')
    end

    def create
      reset_session
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        session[:email] = user.email
        redirect_to root_path
      else
        flash[:alert] = "Could not create account, please try again"
        redirect_to '/'
      end
    end

    private

      def user_params
          params.require(:user).permit(:email, :password)
      end
  


end