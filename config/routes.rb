Rails.application.routes.draw do

  resources :auth, only: [] do
    collection do
      post :sign_in
      post :sign_up
      post :sign_out
    end
  end
  resources :posts, except: :show
end
