Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmle

  namespace :api do
    namespace :v1 do

      namespace :items do
        resources :find, only: :index
        resources :find_all, only: :index
      end

      resources :items, only: [:index, :show] do
        scope module: 'items' do
          resources :merchant, only: :index
        end
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'merchants#show'
      end

      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          resources :merchant, only: :index
          resources :customer, only: :index
        end
        resources :transactions, only: [:index]
        resources :items, only: [:index]
        resources :invoice_items, only: [:index]
        # get '/customer', to: 'customers#show'
      end

      resources :invoice_items, only: [:show, :index] do
        scope module: 'invoice_items'do
          resources :item, only: :index
          resources :invoice, only: :index
        end
      end

      namespace :customers do
        scope module: 'invoices' do
          resources :invoices, only: :index
        end
        resources :find, only: :index
        resources :find_all, only: :index
      end
      resources :customers, only: [:index, :show] do
        resources :invoices, only: [:index]
        resources :transactions, only: [:index]
        get "/favorite_merchant", to: "merchants#favorite"
      end

      resources :transactions, only: [:index, :show] do
        get "/invoice", to: "invoices#show"
      end

      namespace :merchants do
        resources :most_revenue, only: :index
        resources :find, only: :index
        resources :find_all, only: :index
        resources :random, only: :index
      end

      resources :merchants, only: [:show, :index] do
        scope module: 'merchants' do
          resources :items, only: [:show, :index]
          resources :invoices, only: [:show, :index]
        end
      end
    end
  end
end
