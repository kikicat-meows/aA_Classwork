class UsersController < ApplicationController

  def index
    if params.has_key?(:search_user)
      search = params[:search_user].to_s
      @users = User.where("username LIKE '%#{search}%'")
    else
      @users = User.all
    end
    render :index
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # render json: user
      redirect_to user_url(@user)
    else
      # render json: @user.errors.full_messages, status: 418
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    
    if @user
      render :show
    else
      #return user to index page
      redirect_to users_url
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user
      render :edit
    else
      redirect_to users_url
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      # render json: @user.errors.full_messages, status: :unprocessable_entity
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: {}
    else
      redirect_to users_url
    end
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