Rails.application.routes.draw do
  resources :todos
  namespace :api do
    resources :todo_lists, path: :todolists do
      resources :todo_items, path: :todoitems, except: %i[new edit]
    end
  end

  resources :todo_lists, path: :todolists
end
