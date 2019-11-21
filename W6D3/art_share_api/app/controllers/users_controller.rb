class UsersController < ApplicationController

  def index
    if params.has_key?(:search_user)
      search = params[:search_user].to_s
      users = User.where("username LIKE '%#{search}%'")
    else
      users = User.all
    end
    render json: users
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])

    render json: user
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      redirect_to "/users/#{user.id}"
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: {}
  end

  private

    params = ActionController::Parameters.new({
      user: {
        search_user: ""
      }
    })

    # def search
    #   params.require(:user).permit(:search_user)
    # end

    def user_params
      params.require(:user).permit(:username)
    end

end