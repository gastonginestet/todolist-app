module Api
  class TodoListsController < ApiController
    before_action :set_todo_list, only: [:show, :update, :destroy]
    # GET /api/todolists
    def index
      @todo_lists = TodoList.all.includes(:todo_items)

      respond_to :json
    end

    def create
      @todo_list = TodoList.new(todo_list_params)

      if @todo_list.save
        render json: @todo_list, status: :created
      else
        render json: @todo_list.errors, status: :unprocessable_entity
      end
    end

    def update
      if @todo_list.update(todo_list_params)
        render json: @todo_list, status: :ok
      else
        render json: @todo_list.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @todo_list.destroy
        head :no_content
      else
        render json: @todo_list.errors, status: :unprocessable_entity
      end
    end

    def show
      if @todo_list
        render json: @todo_list, status: :ok
      end
    end

    private

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end

    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end
  end
end
