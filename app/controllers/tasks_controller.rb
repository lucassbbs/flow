class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]

  def index
    if params[:client_name] && params[:client_name] != ""
      @tasks = Task.includes(:client).where("clients.name = ?", params[:client_name]).references(:clients)
      if params[:responsible_id] && params[:responsible_id] != ""
        @tasks = @tasks.where(user_id: params[:responsible_id])
      end
    elsif params[:client_name] == ""
      @tasks = Task.all
      if params[:responsible_id] && params[:responsible_id] != ""
        @tasks = @tasks.where(user_id: params[:responsible_id])
      end
    else
      @tasks = Task.all
    end
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
    params = task_params
    if params[:client]
      client_name = params[:client]
      params[:client] = Client.where(name:client_name)[0]
    end
    if params[:user]
      responsible_array_name = params[:user].split('_')
      responsible_first_name = responsible_array_name[0]
      responsible_last_name = responsible_array_name[1]
      params[:user] = User.where(first_name: responsible_first_name, last_name: responsible_last_name)[0]
    end
    @task.update(params)
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
    params.require(:task).permit(:title, :client, :description, :status, :deadline, :archived, :created_by, :photo, :user)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
