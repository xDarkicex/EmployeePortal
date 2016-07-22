class TodosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :toggle_done]

  def index
    @todos = current_user.todos.where(done: false)
    @todones = current_user.todos.where(done: true)
  end
  def toggle_done
    @todo.done = !@todo.done
    @todo.save
    redirect_to todos_url
  end
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end
  def edit
  end
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_url, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end
    def todo_params
      params.require(:todo).permit(:note, :done)
    end
end
