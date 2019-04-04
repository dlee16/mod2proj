Rails.application.routes.draw do
  resources :reservations, only: :index
  resources :reviews, only:[:index, :edit, :update]

  get '/flights/search', to: "flights#new_search", as: "new_search"
  resources :flights, only: [:index,:show] do
    resources :reservations, only:[:create, :show]
    resources :reviews, only:[:index, :new, :create]
    end
  resources :users, only: [:new, :create, :show, :edit, :update, :delete]

  get '/', to: "users#welcome", as: "welcome"

  get '/login/display', to: "users#login_display", as: "login_display"


  patch '/add_to_cart', to:"flights#update", as: :add_flight

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
