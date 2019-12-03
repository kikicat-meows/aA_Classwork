class UsersController < ApplicationController
    before_action :unless_logged_out, only: [:new]

    def new
        @user = User.new
        render :new
    end

    def create
        user = User.new(user_params)

        if user.save
            login!(user)
            redirect_to cats_url
        else
            render :new
        end
    end

    private

    def unless_logged_out
        redirect_to cats_url if current_user
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
