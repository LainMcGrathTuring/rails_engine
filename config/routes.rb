Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmle

  namespace :api do
    namespace :v1 do

      resources :items, only: [:index, :show] do
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'merchants#show'
      end

      resources :invoices, only: [:index, :show] do
        resources :transactions, only: [:index]
        resources :items, only: [:index]
        resources :invoice_items, only: [:index]
        get '/customer', to: 'customers#show'
        get '/merchant', to: 'merchants#show'
      end

      resources :invoice_items, only: [:index, :show] do
        get "/item", to: "items#show"
        get "/invoice", to:"invoices#show"
      end

      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :transactions, only: [:index]
        get "/favorite_merchant", to: "merchants#favorite"
      end

      resources :transactions, only: [:index, :show] do
        get "/invoice", to: "invoices#show"
      end

      resources :merchants, only: [:show, :index] do
        resources :items, only: [:show, :index]
        resources :invoices, only: [:show, :index]
      end
    end
  end
end
