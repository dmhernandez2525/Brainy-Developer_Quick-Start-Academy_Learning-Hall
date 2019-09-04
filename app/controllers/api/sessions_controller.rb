class Api::SessionsController < ApplicationController
    def create 

        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
        # debugger
        if @user
            login(@user)
            render "/api/users/show"
        else
            render json: ["Invalid username or password"], status: 404
        end

    end

    def destroy
        # debugger
        logout
    end
end