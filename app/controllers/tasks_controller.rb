class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit destroy update]

  def index
    @steps = Step.all.order(index: :asc)
    @client = params[:client_name]

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
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def update
    new_step_id = params[:task][:step].to_i
    if params[:client]
      client_name = params[:client]
      params[:client] = Client.where(name:client_name)[0]
    end
    params[:archived] = params[:archived]=='true'? true:false
    if params[:user]
      responsible_array_name = params[:user].split('_')
      responsible_first_name = responsible_array_name[0]
      responsible_last_name = responsible_array_name[1]
      params[:user] = User.where(first_name: responsible_first_name, last_name: responsible_last_name)[0]
    end
    @task.step_id = new_step_id
    if @task.save
      redirect_to tasks_path(@task)
    end
  end
  def create
    params = task_params
    step = Step.find(params[:step_id])
    params[:user] = User.find(step.user_id)
    params[:client] = Client.find(params[:client].to_i)
    @task = Task.new(params)
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
    params.require(:task).permit(:title, :client, :description, :status, :deadline, :archived, :created_by, :photo, :user, :step_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
