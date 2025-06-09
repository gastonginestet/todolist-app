class TodoList < ApplicationRecord
  validates :name, presence: true

  has_many :todo_items, dependent: :destroy

  def complete_all
    todo_items.update_all(completed: true)
  end

  def clear_completed
    todo_items.completed.delete_all
  end
end
