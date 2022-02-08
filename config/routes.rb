Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # authenticated :user do
  #   root to: "home#index"
  # end
  
  unauthenticated :user do
    root "splash#index"
  end
  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :groups do
    resources :products
  end
  devise_scope :user do
    get 'signout', to: 'users/sessions#destroy'
  end
end
