Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants, only: [:index, :create, :new, :show] do
    member do
      resources :reviews, only: [:create, :new]
    end
  end
  # get "/restaurants", to: "restaurants#index"

end
