Rails.application.routes.draw do
  
    # collection do
    #   post 'show', to: 'card#show'
    #   post 'pay', to: 'card#pay'
    #   post 'delete', to: 'card#delete'
    # end 

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to:'productions#index'
  
  resources :users, only: [:show] do
    resources :cards
  end
end

