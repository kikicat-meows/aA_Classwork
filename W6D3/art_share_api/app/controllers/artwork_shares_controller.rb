class ArtworkSharesController < ApplicationController
  def index
    shares = ArtworkShare.all

    render json: shares
    
  end

  def create
    share = ArtworkShare.new(share_params)

    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find(params[:id])

    share.destroy

    render json: {}
  end


  private

  def share_params
    params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
  end

end