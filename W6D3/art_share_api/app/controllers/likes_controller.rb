class LikesController < ApplicationController

  def index
    if params.has_key?(:comment_id)
      likes = Like.where(likeable_id: params[:comment_id], likeable_type: 'Comment')
    elsif params.has_key?(:artwork_id)
      likes = Like.where(likeable_id: params[:artwork_id], likeable_type: 'Artwork')
    end
    render json: likes
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: 418
    end
  end

  def destroy
    like = Like.find_by(id: params[:id])
    if !like.nil?
      like.destroy
      render json: {}
    else
      render json: 'no such like', status: 404
    end
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
  end
end
