class PostsController < ApplicationController
    before_action :require_login, except: [:show]

    def show
        @post = Post.find_by(id: params[:id])
        @sub = Sub.find_by(id: @post.sub_id)
        @author = User.find_by(id: @post.author_id)
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        if current_user.id != @post.author_id
            redirect_to post_url(@post)
        else
            render :edit
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.author_id != current_user.id
            flash.now[:errors] = ['You cannot edit someone else''s post.']
            render :edit
        else
            if @post.update(post_params)
                redirect_to post_url(@post)
            else
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:subject, :content, :url, :sub_id)
        ###missing author_id
    end
end
