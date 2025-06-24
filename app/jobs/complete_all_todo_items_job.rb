# app/jobs/complete_all_todo_items_job.rb
class CompleteAllTodoItemsJob < ApplicationJob
  queue_as :default

  def perform(todo_list)
    todo_list.complete_all
    Turbo::StreamsChannel.broadcast_replace_to(
      "todo_list_#{todo_list.id}",
      target: "todo_items_list",
      partial: "todo_items/list",
      locals: { todo_list: todo_list }
    )
  end
end
