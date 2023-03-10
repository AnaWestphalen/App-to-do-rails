# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_list_params, only: %i[new create edit update destroy]
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.list = @list
    @task.user = current_user

    if @task.save
      redirect_to list_path(@list), notice: 'Sua nova tarefa foi criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to list_task_path(@task.list, @task), notice: 'Sua tarefa foi atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to lists_path, notice: 'Sua tarefa foi deletada com sucesso.'
  end

  private

  def set_list_params
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
