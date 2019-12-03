class SubsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    # before_action :require_moderator, only: [:edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        @moderator = User.find_by(id: @sub.user_id)
        @posts = Post.where(sub_id: @sub.id)
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        if current_user.id != @sub.user_id
            redirect_to sub_url(@sub)
        else
            render :edit
        end
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.user_id != current_user.id
            flash.now[:errors] = ['Permission Denied']
            render :edit
        else
            if @sub.update(sub_params)
                redirect_to sub_url(@sub)
            else
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end
        end
    end

    private

    # def require_moderator
    #     return if current_user.subs.find_by(id: params[:id])
    #     render json: 'Forbidden', status: :forbidden
    # end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
