class ArtworksController < ApplicationController

  def index
    if params.has_key?(:user_id) 
      artworks_owned = Artwork.where(artist_id: params[:user_id])
      artworks_shared = Artwork.joins(:viewers).where(artwork_shares: {viewer_id: params[:user_id]})
      render json: { artworks_owned: artworks_owned, artworks_shared: artworks_shared }, status: :ok
      # artworks_owned += artworks_shared
      # render json: artworks_owned
    else
      artworks = Artwork.all
      render json: artworks
    end
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      redirect_to "/artworks/#{artwork.id}"
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])

    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      redirect_to "/artworks/#{artwork.id}"
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy

    render json: {}
  end

  def set_favorite
    artwork = Artwork.find(params[:id])
    # debugger
    if artwork.favorite.nil?
      artwork.update_column(:favorite, true)
    end
    render json: artwork
  end

  def remove_favorite
    artwork = Artwork.find(params[:id])
    if !artwork.favorite.nil?
      artwork.update_column(:favorite, "")
    end
    render json: artwork
  end

  private
    params = ActionController::Parameters.new({
      artwork: {
        favorite: ""
      }
    })

    def artwork_params
      params.require(:artwork).permit(:title, :img_url, :artist_id)
    end
  
  
end