TodoList.create(name: 'Setup Rails Application')

1000.times do |i|
  TodoItem.create(name: "Todo Item #{i + 1}", todo_list_id: 1)
end