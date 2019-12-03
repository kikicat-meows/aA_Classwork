require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # resources :users, only: [:show, :new, :create]

  describe 'GET #new' do
    it 'renders the new template' do
        get :new 
        expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let (:user_params) do
      { user: {
              username: 'frank',
              password: 'password'
          }
      }
    end

    let (:invalid_user_params) do
      { user: {
              username: 'tobiascat',
              password: ''
          }
      }
    end

    context 'with valid params' do
      it 'logs in the user' do
          post :create, params: user_params

          user = User.find_by(username: 'frank')
          expect(session[:session_token]).to eq(user.session_token)
      end

      it 'redirects to the user show page' do
          post :create, params: user_params

          user = User.find_by(username: 'frank')
          expect(response).to redirect_to(user_url(user))
      end
    end

    context 'with invalid params' do
      it 'renders new template with errors' do
          post :create, params: invalid_user_params
          expect(response).to render_template(:new)
          expect(flash[:errors]).to be_present
      end
    end
  end

end
