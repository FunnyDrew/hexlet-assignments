# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    flash[:success] = 'Everything is allright'
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.completed = false
    if @task.save
      flash[:success] = 'New task successfuly created'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Task successfuly updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      render :edit
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :creator)
  end
end
