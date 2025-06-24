class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[edit update destroy complete_all clear_completed]

  # GET /todolists or /todolists.json
  def index
    @todolists = TodoList.all
  end

  # GET /todolists/1 or /todolists/1.json
  def show
    @todolist = TodoList.find(params[:id])
    @todo_items = @todolist.todo_items.order(created_at: :desc).page(params[:page])
  end

  # GET /todolists/new
  def new
    @todolist = TodoList.new
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists or /todolists.json
  def create
    @todolist = TodoList.new(todo_list_params)

    respond_to do |format|
      if @todolist.save
        format.html { redirect_to todo_lists_path, notice: "TodoList was successfully created." }
        format.json { render :show, status: :created, location: @todolist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todolists/1 or /todolists/1.json
  def update
    respond_to do |format|
      if @todolist.update(todo_list_params)
        format.html { redirect_to todo_lists_path, notice: "TodoList was successfully updated." }
        format.json { render :show, status: :ok, location: @todolist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todolists/1 or /todolists/1.json
  def destroy
    @todolist.destroy

    respond_to do |format|
      format.html { redirect_to todo_lists_path, notice: "TodoList was successfully destroyed." }
      format.turbo_stream
    end
  end

  def complete_all
    @todo_list = TodoList.find(params[:id])
    CompleteAllTodoItemsJob.perform_later(@todo_list)
    respond_to do |format|
      format.turbo_stream do
        flash[:notice] = "Marcando como completado en background..."
        render turbo_stream: turbo_stream.update("flash", partial: "shared/flash")
      end
      format.html { redirect_to todo_lists_path, notice: "Job encolado." }
    end
  end

  def clear_completed
    ClearAllTodoItemsJob.perform_later(@todo_list.id)
    respond_to do |format|
      format.turbo_stream do
        flash[:notice] = "Limpiando completados en segundo plano..."
        render turbo_stream: turbo_stream.update("flash", partial: "shared/flash")
      end
      format.html { redirect_to todo_lists_path, notice: "Job encolado." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todolist = TodoList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end
