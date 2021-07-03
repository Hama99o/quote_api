Rails.application.routes.draw do
  root to: "application#redirect_to_quotes"

  resources :quotes, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'quotes', to: "quotes#index", as: 'quotes'
      get 'authors', to: "quotes#authors", as: 'authors'
      get 'quotes/random', to: "quotes#random", as: 'random'
      get 'quotes/:id',  to: "quotes#show"
    end
  end
end
