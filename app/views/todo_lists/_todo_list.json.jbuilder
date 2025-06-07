json.extract! todolist, :id, :created_at, :updated_at
json.url todo_url(todolist, format: :json)
