class UsersController < ApplicationController

    def dashboard
    end

    def create
        user = User.new(user_params)
    end

    #want to create new user without password when coming from oauth
    def create_from_oauth

end