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

  def set_favorite
    share = ArtworkShare.find(params[:id])
    # debugger
    if share.favorite.nil?
      share.update_column(:favorite, true)
    end
    render json: share
  end

  def remove_favorite
    share = ArtworkShare.find(params[:id])
    if !share.favorite.nil?
      share.update_column(:favorite, "")
    end
    render json: share
  end

  private

  params = ActionController::Parameters.new({
    artwork_share: {
      favorite: ""
    }
  })

  def share_params
    params.require(:artwork_share).permit(:viewer_id, :artwork_id)
  end

end