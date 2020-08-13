Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to:'productions#index'

  resources :productions, only: [:index, :new, :show]
  resources :users, only: [:show] do
    
  end
  resources :cards do
    collection do
      #payjpでトークン化を行う
      post 'pay', to: 'cards#pay'
      #カード削除
      # post 'destroy', to: 'cards#destroy'
      #カード情報入力
      # post 'show', to: 'cards#show'
    end
  end
end


