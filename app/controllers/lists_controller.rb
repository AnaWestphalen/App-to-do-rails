# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
    # @task = Task.new
  end

  def new
    @list = List.new
  end

  def edit; end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'Lista foi criada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to list_path(@list), notice: 'Lista foi editada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'Lista foi destruída com sucesso.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
