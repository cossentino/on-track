class UsersController < ApplicationController

    def dashboard
    end

    def create
        user = User.new(user_params)
    end

end