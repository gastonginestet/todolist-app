# app/jobs/clear_all_todo_items_job.rb
class ClearAllTodoItemsJob < ApplicationJob
  queue_as :default

  def perform(todo_list_id)
    todo_list = TodoList.find(todo_list_id)
    todo_list.clear_completed

    Turbo::StreamsChannel.broadcast_replace_to(
      "todo_list_#{todo_list.id}",
      target: "todo_items_list",
      partial: "todo_items/list",
      locals: { todo_list: todo_list }
    )
  end
end