Rails.application.routes.draw do
  root to: "application#redirect_to_quotes"

  resources :quotes, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'quotes', to: "quotes#index", as: 'quotes'
      get 'quotes/random', to: "quotes#random", as: 'randomuquote'
      get 'quotes/:id',  to: "quotes#show"

      get 'authors', to: "authors#index", as: 'authors'
      get 'authors/random', to: "authors#random", as: 'random_authors'
      get 'authors/:id',  to: "authors#show"
    end
  end
end
