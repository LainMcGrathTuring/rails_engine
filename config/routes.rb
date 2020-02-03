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
          resources :invoice_items, only: :index
        end
      end

      namespace :invoices do
        resources :find, only: :index
        resources :transaction, only: :index
      end

      resources :invoices, only: [:index, :show] do
        scope module: 'invoices' do
          resources :merchant, only: :index
          resources :customer, only: :index
          resources :invoice_items, only: :index
          resources :transactions, only: :index
        end
        resources :items, only: [:index]
      end

      namespace :invoice_items do
        resources :find, only: :index
        resources :find_all, only: :index
      end

      resources :invoice_items, only: [:show, :index] do
        scope module: 'invoice_items' do
          resources :item, only: :index
          resources :invoice, only: :index
        end
      end

      namespace :customers do
        scope module: 'customers' do
          resources :invoices, only: :index
        end
        resources :find, only: :index
        resources :find_all, only: :index
      end

      resources :customers, only: [:show, :index] do
        scope module: 'customers' do
          resources :invoices, only: :index
        end

      end

      resources :customers, only: [:index, :show] do
        resources :invoices, only: :index
        resources :transactions, only: [:index]
        get "/favorite_merchant", to: "merchants#favorite"
      end

      resources :transactions, only: [:index, :show] do
        scope module: 'transactions' do
          resources :invoice, only: :index
        end
      end

      namespace :merchants do
        resources :most_revenue, only: :index
        resources :find, only: :index
        resources :find_all, only: :index
        resources :random, only: :index
        resources :most_items, only: :index
      end

      resources :merchants, only: [:show, :index] do
        scope module: 'merchants' do
          resources :items, only: [:show, :index]
          resources :invoices, only: [:show, :index]
          resources :revenue, only: :index
          resources :favorite_customer, only: :index
        end
      end
    end
  end
end
