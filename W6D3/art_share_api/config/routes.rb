Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ### users
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    ### search for artwork through user_id
    resources :artworks, only: [:index] do
      resources :comments, only: [:index] do
        resources :likes, only: [:index]
      end

      resources :likes, only: [:index]
    end

    ### search for comments through user_id
    resources :comments, only: [:index] do
      resources :likes, only: [:index]
    end

    ### user's artwork collection
    resources :artwork_collections, only: [:index]
  end

  ### artworks
  resources :artworks, only: [:index, :create, :show, :update, :destroy] do
    ### search for comments through artwork
    resources :comments, only: [:index] do
      resources :likes, only: [:index]
    end

    resources :likes, only: [:index]

    member do
      get 'set_favorite'
    end

    member do
      get 'remove_favorite'
    end
  end

  ### artwork_shares
  resources :artwork_shares, only: [:index, :create, :destroy] do
    member do
      get 'set_favorite'
    end

    member do
      get 'remove_favorite'
    end
  end


  ### comments
  resources :comments, only: [:index, :create, :destroy] do
    resources :likes, only: [:index]
  end


  ### likes
  resources :likes, only: [:create, :destroy]

  ### artwork collections
  resources :artwork_collections, only: [:create, :destroy]
end


