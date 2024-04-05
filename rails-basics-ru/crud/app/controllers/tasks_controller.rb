class TasksController < ApplicationController
	def index
		@tasks = Task.all
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

	def show
		@task = Task.find(params[:id])
	end

	private

	def task_params
		params.require(:task).permit(:name, :description, :creator)
	end
end
