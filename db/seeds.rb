TodoList.create(name: 'Setup Rails Application')
TodoList.create(name: 'Setup Docker PG database')
TodoList.create(name: 'Create todo_lists table')
TodoList.create(name: 'Create TodoList model')
TodoList.create(name: 'Create TodoList controller')

TodoList.create(name: 'Create todo_items table')
TodoItem.create(name: 'Create TodoItem model', description: 'Add validations and associations', todo_list_id: 1)