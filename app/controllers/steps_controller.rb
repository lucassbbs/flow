class StepsController < ApplicationController
  before_action :set_step, only: %i[edit destroy update]
  def index
    @steps = Step.all.order(index: :asc)
  end

  def new
    @step = Step.new
  end

  def edit; end

  def update
    @step.update(step_params)
    redirect_to steps_path
  end

  def destroy
    @step.destroy
    steps = Step.all.order(index: :asc)
    steps.each_with_index do |step, index|
      step.index = index + 1
      step.save
    end
    redirect_to steps_path
  end

  def create
    @step = Step.new(step_params)
    @step.index = Step.all.pluck(:index).max + 1
    if @step.save
      redirect_to steps_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def reorder
    num_steps = Step.all.count
    steps = []
    steps_order = params[:stepsOrder].tr('[]', '').split(',').map(&:to_i)
    (1..num_steps).each do |new_index|
      step = Step.find_by_index(steps_order[new_index - 1])
      step.index = new_index
      steps.append(step)
    end
    steps.each(&:save)
    redirect_to steps_path
  end

  private

  def step_params
    params.require(:step).permit(:name, :color, :user_id)
  end

  def set_step
    @step = Step.find(params[:id])
  end

end
