class SessionsController < ApplicationController
    before_action :logged_out, only: [:new]

    def new
        @user = User.new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        ### CANNOT use params for session

        if user
            login!(user) ###login!(user) in ApplicationControl
            redirect_to cats_url
        else
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

    private

    def logged_out
        if current_user 
            redirect_to cats_url
        end
    end

    # def user_params
    #     params.require(:user).permit(:username, :password)
    # end

end
