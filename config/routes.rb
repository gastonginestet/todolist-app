Rails.application.routes.draw do
  root "todo_lists#index"
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
