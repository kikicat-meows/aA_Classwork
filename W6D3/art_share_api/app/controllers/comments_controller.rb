class CommentsController < ApplicationController

  def index
    # comments = Comment.all
    # render json: comments
    if params.has_key?(:user_id)
      comments = Comment.where(author_id: params[:user_id])
    elsif params.has_key?(:artwork_id)
      comments = Comment.where(artwork_id: params[:artwork_id])
    else
      comments = Comment.all
    end
    render json: comments

  end


  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: 418
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if !comment.nil?
      comment.destroy
      render json: {}
    else
      render json: 'Comment Does Not Exist', status: 404
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :artwork_id, :body)
  end

end
