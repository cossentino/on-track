class UsersController < ApplicationController

    def dashboard
        @user = current_user
        view_or_redirect(:dashboard, :'/sessions/landing')
    end


end