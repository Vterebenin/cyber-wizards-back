Rails.application.routes.draw do
  resources :decks
  resources :cards
  namespace :api do
    resources :mages, only: %i[index show create destroy update]
  end
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
