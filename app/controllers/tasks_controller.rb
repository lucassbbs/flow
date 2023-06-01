class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]

  def index
    @tasks = Task.all
    #TODO: arrumar filtros de seleção
    # if params[:category]
    #   @category = params[:category]
    #   @foods = Food.where(category: params[:category])
    # else
    #   @foods = Food.all
    # end
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def create
    @task = Task.new(task_params)
    @task.status = 'solicitado'
    @task.archived = false
    @task.created_by = current_user.id
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :client, :description, :status, :deadline, :archived, :created_by, :photo)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
