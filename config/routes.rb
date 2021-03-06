Rails.application.routes.draw do
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end
  
  unauthenticated :user do
    root "splash#index"
  end
  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :groups, only: [:new, :create] do
    resources :products, only: [:index, :new, :create]
  end
  devise_scope :user do
    get 'signout', to: 'users/sessions#destroy'
  end
end
