class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new todo_params
    if @todo.save
      redirect_to todos_path
    else
      redirect_to todos_new_path, notice: 'Description is required.'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      redirect_to edit_todo_path, notice: 'Description is required.'
    end
  end

  def destroy
    @todo.delete
    redirect_to todos_path
  end

  def complete
    @todo[:completed] = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
  end

  private
  def set_todo
    @todo = Todo.find params[:id]
  end

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
