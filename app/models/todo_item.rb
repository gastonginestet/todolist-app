class TodoItem < ApplicationRecord
  validates :name, presence: true

  belongs_to :todo_list
end