class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: [:update, :destroy]

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @todo_list, notice: 'Todo item was successfully created.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("todo_item_form", partial: "todo_items/form", locals: { todo_list: @todo_list, todo_item: @todo_item }) }
        format.html { redirect_to @todo_list, alert: 'Error creating todo item.' }
      end
    end
  end

  def update
    if @todo_item.update(todo_item_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @todo_list, notice: 'Todo item was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@todo_item), partial: "todo_items/item", locals: { todo_list: @todo_list, todo_item: @todo_item }) }
        format.html { redirect_to @todo_list, alert: 'Error updating todo item.' }
      end
    end
  end

  def destroy
    @todo_item.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @todo_list, notice: 'Todo item was successfully removed.' }
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:name, :completed)
  end
end
