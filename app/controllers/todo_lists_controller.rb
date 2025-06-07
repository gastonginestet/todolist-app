class TodoListsController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todolists or /todolists.json
  def index
    @todolists = TodoList.all
  end

  # GET /todolists/1 or /todolists/1.json
  def show
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
    @todolist = TodoList.new(todo_params)

    respond_to do |format|
      if @todolist.save
        format.html { redirect_to todo_url(@todolist), notice: "TodoList was successfully created." }
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
      if @todolist.update(todo_params)
        format.html { redirect_to todo_url(@todolist), notice: "TodoList was successfully updated." }
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
      format.html { redirect_to todos_url, notice: "TodoList was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todolist = TodoList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.fetch(:todolist, {})
    end
end
