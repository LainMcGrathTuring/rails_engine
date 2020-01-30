Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmle

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :merchants, only: [:show, :index] do
        resources :items, only: [:show, :index]
        resources :invoices, only: [:show, :index]
      end
    end
  end
end
