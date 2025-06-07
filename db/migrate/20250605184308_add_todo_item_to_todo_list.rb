class AddTodoItemToTodoList < ActiveRecord::Migration[7.0]
  def change
    create_table :todo_items do |t|
      t.string :name
      t.string :description
      t.boolean :completed, default: false
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end

    add_index :todo_items, [:todo_list_id, :name], unique: true
  end
end
