module Api
  class TodoItemsController < ApiController
    before_action :set_todo_item, only: [:show, :update, :destroy]
    # GET /api/todoitems
    def index
      @todo_list = TodoList.find(params[:todo_list_id])
      @todo_items = @todo_list.todo_items

      render json: @todo_items, status: :ok
    end

    def create
      @todo_item = TodoItem.new(todo_item_params)

      if @todo_item.save
        render json: @todo_item, status: :created
      else
        render json: @todo_item.errors, status: :unprocessable_entity
      end
    end

    def update
      if @todo_item.update(todo_item_params)
        render json: @todo_item, status: :ok
      else
        render json: @todo_item.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @todo_item.destroy
        head :no_content
      else
        render json: @todo_item.errors, status: :unprocessable_entity
      end
    end

    def show
      if @todo_item
        render json: @todo_item, status: :ok
      end
    end

    private

    def todo_item_params
      params.require(:todo_item).permit(:name)
    end

    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end
  end
end
