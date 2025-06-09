class TodoItem < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :todo_list_id }

  belongs_to :todo_list

  scope :completed, -> { where(completed: true) }
end
