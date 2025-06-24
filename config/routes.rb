Rails.application.routes.draw do
  require 'sidekiq/web'
  root "todo_lists#index"
  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    resources :todo_lists, path: :todolists do
      resources :todo_items, path: :todoitems

      member do
        patch :complete_all
        patch :clear_completed
      end
    end
  end

  resources :todo_lists, path: :todolists do
    resources :todo_items, path: :todoitems

    member do
      patch :complete_all
      patch :clear_completed
    end
  end
end
