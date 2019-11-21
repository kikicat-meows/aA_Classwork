class ArtworkCollectionsController < ApplicationController
  def index
    collection = ArtworkCollection.where(user_id: params[:user_id])

    render json: collection
  end

  def create
    collectible = ArtworkCollection.new(collection_params)    
    if collectible.save
      render json: collectible
    else
      render json: collectible.errors.full_messages, status: 418
    end
  end

  def destroy
    collectible = ArtworkCollection.find_by(id: params[:id])
    if !collectible.nil?
      collectible.destroy
      render json: {}
    else
      render json: 'Cannot destroy something that doesn''t exist', status: 404
    end
  end


  private
  def collection_params
    params.require(:artwork_collection).permit(:user_id, :artwork_id)
  end
end
