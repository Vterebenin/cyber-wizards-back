Rails.application.routes.draw do
  get 'fight_field', to: 'fight_field#show'
  resources :decks
  resources :cards
  mount ActionCable.server => '/cable'
  namespace :api do
    resources :mages, only: %i[index show create destroy update]
  end
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
