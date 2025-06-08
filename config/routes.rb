Rails.application.routes.draw do
  root "todo_lists#index"
  namespace :api do
    resources :todo_lists, path: :todolists do
      resources :todo_items, path: :todoitems, except: %i[new edit]
    end
  end

  resources :todo_lists, path: :todolists do
    resources :todo_items, only: [:create, :update, :destroy]
  end
end
